
const std = @import("std");

const Node = struct {
	value: i32,	
};

fn foo(value: i32) *Node {
	var node = Node{ .value = value };
	return &node; 	
}

pub fn main() !void {
	var node = foo(123);
	var deno = foo(321);
	std.debug.print("{d}\n", .{node.*.value});
	std.debug.print("{d}\n", .{deno.*.value});
}






