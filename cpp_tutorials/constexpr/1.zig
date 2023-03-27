const std = @import("std"); 

fn fib(n: i32) i32 {
	var a: i32 = 1;
	var b: i32 = 0;
	var c: i32 = 0; 
	var i: i32 = 0;
	while (i < n) : (i += 1) {
		c = a; 
		a = b; 
		b += c; 
	}
	return b; 
}

fn foo(n: i32) i32 {
	return 10000 * n + 1234;
} 	

pub fn main() !void {
	// var f0 = fib(10); 
	// var f1 = comptime fib(11); 
	// const f2 = fib(12); 
	// comptime var f3 = fib(13);

	var f0 = foo(10); 
	var f1 = comptime foo(11);  // this 
	const f2 = foo(12);
	comptime var f3 = foo(13); // this
	f3 += 1;	
	
	std.debug.print("{d}\n", .{f0}); 
	std.debug.print("{d}\n", .{f1}); 
	std.debug.print("{d}\n", .{f2}); 
	std.debug.print("{d}\n", .{f3}); 
	
	comptime var i: usize = 1; 	
	comptime var a: i32 = 1;
	inline while (i < 12) : (i += 1) {
		a *= i; 
	}
	
	std.debug.print("{d}\n", .{a});			
}





