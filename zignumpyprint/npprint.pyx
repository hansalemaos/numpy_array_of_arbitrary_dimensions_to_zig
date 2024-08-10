import cython
cimport cython
import os
import numpy as np
cimport numpy as np
import time, subprocess
from libcpp.string cimport string
from libcpp.unordered_map cimport unordered_map
import ctypes
import re
this_folder = os.path.dirname(__file__)


ctypedef fused fusednumbers:
    np.npy_byte
    np.npy_ubyte
    np.npy_short
    np.npy_ushort
    np.npy_int
    np.npy_uint
    np.npy_long
    np.npy_ulong
    np.npy_longlong
    np.npy_ulonglong
    np.npy_intp
    np.npy_uintp
    np.npy_float
    np.npy_double
    np.npy_longdouble
    cython.longdoublecomplex

ctypedef void (*func_t)(size_t,size_t,size_t,size_t,size_t,size_t) noexcept nogil ;


def compile_it(ziglibfile):
    zigpathstr = os.path.normpath(os.path.join(this_folder, ziglibfile))
    winpathstr = re.sub(r'\.zig$','.dll',zigpathstr)
    linuxpathstr = re.sub(r'\.zig$','.so',zigpathstr)
    win_path=os.path.exists(winpathstr)
    linux_path=os.path.exists(linuxpathstr)
    if not os.path.exists(winpathstr) and not os.path.exists(winpathstr) :
        old_folder=os.getcwd()
        os.chdir(this_folder)
        subprocess.run(
        ["zig", "build-lib", ziglibfile, "-dynamic", "-O", "ReleaseFast"],
        shell=True,
        env=os.environ,
        )
        time.sleep(1)
        win_path=os.path.exists(winpathstr)
        linux_path=os.path.exists(linuxpathstr)
        os.chdir(old_folder)
    if win_path:
        return winpathstr
    if linux_path:
        return linuxpathstr
    raise OSError('Zig library not found')

ziglibfile='zigprint.zig'
library_path_string=compile_it(ziglibfile)
_func_cache = []


cdef unordered_map[string, func_t] get_lookup_dict(str dllpathstr,dict functiondict, object argtypes, object restype):
    cdef:
        unordered_map[string, func_t] dtype_lookup
    cta = ctypes.cdll.LoadLibrary(dllpathstr)
    _func_cache.append(cta)
    for npdtype,zigfunction in functiondict.items():
        ctypes_f=getattr(cta, zigfunction)
        ctypes_f.argtypes =  argtypes # useless?
        ctypes_f.restype =  restype # useless?
        dtype_lookup[npdtype]=(<func_t*><size_t>ctypes.addressof(ctypes_f))[0]
    return dtype_lookup

functiondict={
"i":"print_numpy_array_c_int",
"l":"print_numpy_array_c_int",
"L":"print_numpy_array_c_uint",
"I":"print_numpy_array_c_uint",
"b":"print_numpy_array_c_char",
"B":"print_numpy_array_c_char",
"h":"print_numpy_array_c_short",
"H":"print_numpy_array_c_ushort",
"q":"print_numpy_array_c_longlong",
"Q":"print_numpy_array_c_ulonglong",
"f":"print_numpy_array_f32",
"d":"print_numpy_array_f64",
"D":"print_numpy_array_f128",
}

cdef:
    unordered_map[string, func_t] dtype_lookup = get_lookup_dict(
        dllpathstr=library_path_string,
        functiondict=functiondict,
        argtypes=[ctypes.c_size_t] * 6,
        restype = None )



def numpy2zig(fusednumbers[:] a,str dtype, unsigned long long[:] shape_of_a):
    cdef:
        bytes byte_type=dtype.encode()
        const char* byte_type_char=byte_type
        size_t address_of_shape = <size_t>&shape_of_a[0]
        size_t len_shape_of_a_full=shape_of_a.shape[0]
        size_t a_array_ptr = <size_t>&a[0]
        size_t len_a = np.prod(shape_of_a)
        np.ndarray[np.npy_ulonglong, ndim=1, mode="c", cast=False] done_index_full = np.zeros(len_shape_of_a_full, dtype=np.uint64)
        size_t[:] done_index = done_index_full
        size_t address_done_index = <size_t>&done_index[0]
        np.ndarray[np.npy_ulonglong, ndim=1, mode="c", cast=False] index_reversed_full = np.arange(len_shape_of_a_full, dtype=np.uint64)[::-1].astype(np.uint64)
        size_t[:] index_reversed=index_reversed_full
        size_t address_index_reversed = <size_t>&index_reversed[0]
        size_t len_index_reversed = len(index_reversed_full)
    dtype_lookup[byte_type_char](
        a_array_ptr,
        len_a,
        address_of_shape,
        address_done_index,
        address_index_reversed,
        len_index_reversed,
    )

