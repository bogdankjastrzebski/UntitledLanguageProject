
const std = @import("std"); 

const Node = union {
	leaf: Leaf, 
	combine: Combine
}

const Leaf = struct {
	int: i32;
};

const Combine = struct {
	lhs: Leaf; 
	rhs: Leaf;
};

fn leaf(i: i32) Leaf {
	return Leaf {
		.int = int,
	}
}

fn combine(lhs: Node, rhs: Node) Combine {
	return Combine {
		.lhs = lhs,
		.rhs = rhs
	}
}

pub fn main() !void {
	var a = leaf(9);
	var b = leaf(3);
	var c = combine(a, b);		
}



