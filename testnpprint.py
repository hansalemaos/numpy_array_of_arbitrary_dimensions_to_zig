from zignumpyprint import numpyzigprint
import numpy as np
shape=(3,3,3)

c = np.random.randint(1, 127, np.prod(shape), dtype="i").reshape(shape)
dtypes = [
    "i",
    "l",
    "L",
    "I",
    "b",
    "B",
    "h",
    "H",
    "q",
    "Q",
    "f",
    "d",
    #"D",
]
for d in dtypes:
    tmp = c.astype(d)
    numpyzigprint(tmp)

# a2 = np.arange(10 * 20 * 3).reshape((10, 20, 3)).astype(np.uint64)
# numpyzigprint(a2)

# a3 = np.arange(2 * 4 * 3 * 2 * 5).reshape((2, 4, 3, 2, 5)).astype(np.uint64)
# numpyzigprint(a3)
# fl2 = a3.ravel()
# fl2shape = np.array(a3.shape, dtype=np.uint64)
# zignumpyprint.npprint.numpy2zig(fl2, a3.dtype.char, fl2shape)
