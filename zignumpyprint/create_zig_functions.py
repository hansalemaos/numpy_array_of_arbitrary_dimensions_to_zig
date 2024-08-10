zigfunction = "print_numpy_array"
zigfuncraw = R"""export fn FUNCTIONZIG_DATATYPEZIG(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
        const pointer_address_of_numpy_array: [*]DATATYPEZIG = @ptrFromInt(address_of_numpy_array);
        var pointer_address_of_tmp_numpy_shape_array: [*]usize = @ptrFromInt(address_of_tmp_numpy_shape_array);
        _ = &pointer_address_of_tmp_numpy_shape_array;
        const pointer_address_of_numpy_array_shape: [*]usize = @ptrFromInt(address_of_numpy_array_shape);
        const pointer_address_of_reversed_numpy_shape_range: [*]usize = @ptrFromInt(address_of_reversed_numpy_shape_range);

        for (0..len_of_flat_numpy_array) |flat_index| {
            calculate_nested_index_c_order(
                flat_index,
                pointer_address_of_numpy_array_shape,
                pointer_address_of_tmp_numpy_shape_array,
                pointer_address_of_reversed_numpy_shape_range,
                len_of_numpy_shape_array,
            );
            for (0..len_of_numpy_shape_array) |part_of_nested_index| {
                std.debug.print("{} | ", .{pointer_address_of_tmp_numpy_shape_array[part_of_nested_index]});
            }

            std.debug.print(" -> {}\n", .{pointer_address_of_numpy_array[flat_index]});
        }
    }
    """
zigdatatypes = [
    "c_int",
    "c_int",
    "c_uint",
    "c_uint",
    "c_char",
    "c_char",
    "c_short",
    "c_ushort",
    "c_longlong",
    "c_ulonglong",
    "f32",
    "f64",
    "f128",
]
numpy_short_dtypes = [
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
    "D",
]

allfunctions = {}
# from rich import print
for zigdatatype, numpy_short_dtype in zip(zigdatatypes, numpy_short_dtypes):
    zigfuncdtyped = zigfuncraw.replace("DATATYPEZIG", zigdatatype).replace(
        "FUNCTIONZIG", zigfunction
    )
    allfunctions[numpy_short_dtype] = {
        "funcname": zigfunction + "_" + zigdatatype,
        "func": zigfuncdtyped,
    }
allfus = sorted({h["func"] for h in allfunctions.values()})
for f in allfus:
    print(f)

print("functiondict={")
for k, v in allfunctions.items():
    print(f""""{k}":"{v["funcname"]}",""")

print("}")
