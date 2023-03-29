
# Idea for a new syntax

Julia and other languages use different syntax than me, maybe make something different? 

let fib(n Int) Int {
	a, b Int: 1, 0
	for _ in 0..n { a, b : b, a+b }	
	return b
}

# Why this syntax is better? 
# We can more clearly express our macros:

let show variable {
	str : String(variable);
	return {quote {std.debug.print($str, " : ", $variable)}};
}

# We can now use show as a regular keyword:
let fib(n Int) Int {
	a, b Int: 1, 0
	for _ in 0..n {
		show (a, b)
		a, b: b, a+b
	}
	return b
}


0 = (λf.(λx.x))
1 = (λf.(λx.(f(0x))))
2 = (λf.(λx.(f(1x))))
3 = (λf.(λx.(f(2x))))
...



let sort_str(string string?) string? {
	counts : [zero(ui32?) for _ in 0..255]	
	for letter string {
		counts[letter] +: 1	
	}	
	str : [zero(char?) for _ in 0..255]
	ind : zero(i32)	
	for char, count in enumerate(counts) {
		while count != 0 {
			str[ind] = char 
		}	
	}
	return str
}



let sort_str(string string?) string? {
	counts : [zero(ui32?) for _ in 0..256];
	for letter in string {
		counts[letter] +: 1;	
	};	
	str : [zero(char?) for _ in 0..256];
	ind : zero(i32);	
	for char, count in enumerate(counts) { 
		while (count ≠ 0) { str[ind] : char }
	};
	return str;
};

let sort_str(string string) string
	
	counts : [zero(ui32) for _ in 0..256]	
	for letter in string
		counts[letter] +: 1
	
	str : [zero(char) for _ in 0..256]	
	ind : zero(i32)
	for char, count in enumerate(counts)
		while count ≠ 0
			str[ind] : char

	return str
	
	@set name
	quote
		a : 0
		b : 1
		for _ in 0..n	
			
	
		


