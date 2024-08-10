const std = @import("std");

fn calculate_nested_index_c_order(flat_index: usize, pointer_address_of_numpy_array_shape: [*]usize, pointer_address_of_tmp_numpy_shape_array: [*]usize, pointer_address_of_reversed_numpy_shape_range: [*]usize, len_of_numpy_shape_array: usize) void {
    var var_get_out_0 = flat_index;
    var var_get_out_1: usize = 0;
    var var_stays: usize = 0;
    for (0..len_of_numpy_shape_array) |shape_index| {
        var_get_out_1 = @divFloor(var_get_out_0, pointer_address_of_numpy_array_shape[pointer_address_of_reversed_numpy_shape_range[shape_index]]);
        var_stays = @mod(var_get_out_0, pointer_address_of_numpy_array_shape[pointer_address_of_reversed_numpy_shape_range[shape_index]]);
        var_get_out_0 = var_get_out_1;
        pointer_address_of_tmp_numpy_shape_array[pointer_address_of_reversed_numpy_shape_range[shape_index]] = var_stays;
    }
}
export fn print_numpy_array(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]usize = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_char(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_char = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_int(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_int = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_longlong(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_longlong = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_short(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_short = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_uint(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_uint = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_ulonglong(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_ulonglong = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_c_ushort(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]c_ushort = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_f128(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]f128 = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_f32(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]f32 = @ptrFromInt(address_of_numpy_array);
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

export fn print_numpy_array_f64(address_of_numpy_array: usize, len_of_flat_numpy_array: usize, address_of_numpy_array_shape: usize, address_of_tmp_numpy_shape_array: usize, address_of_reversed_numpy_shape_range: usize, len_of_numpy_shape_array: usize) void {
    const pointer_address_of_numpy_array: [*]f64 = @ptrFromInt(address_of_numpy_array);
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
