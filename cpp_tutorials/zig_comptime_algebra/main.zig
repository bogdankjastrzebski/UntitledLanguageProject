
const std = @import("std"); 

const NodeTag = enum {
	leaf, 
	combine,	
};

const Node = union (NodeTag) {
	leaf: Leaf, 
	combine: Combine,
	fn value(self: Node) i32 {
		switch (self) {
			NodeTag.leaf    => |l| return l.int, 
			NodeTag.combine => |c| return c.lhs.value() + c.rhs.value(),
		} 
	}
};

const Leaf = struct {
	int: i32,
};

const Combine = struct {
	lhs: *Node, 
	rhs: *Node,
};

fn node(n: anytype) Node {
	switch (@TypeOf(n)) {
		Leaf    => return Node{    .leaf = n },
		Combine => return Node{ .combine = n },
		else => unreachable, 
	}
}

fn leaf(int: i32) Leaf {
	return Leaf {
		.int = int,
	};
}

fn combine(lhs: *Node, rhs: *Node) Combine {	
	return Combine {
		.lhs = lhs,
		.rhs = rhs,
	};
}

fn val(v: anytype) Node {
	return node(leaf(v));
}

fn add(lhs: anytype, rhs: anytype) Node {
	return node(combine(lhs, rhs)); 
} 

pub fn main() !void {
	comptime var a = val(999999);
	comptime var b = val(333333);
	comptime var c = add(&a, &b);
	comptime var v = c.value();
	// std.debug.print("{d}\n", .{c.value()});	
	std.debug.print("{d}\n", .{v});
}



