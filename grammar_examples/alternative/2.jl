
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
		while (count ≠ 0) { str[ind] : char };
	};
	return str;
};

let sort_str(string string?) string? {
	counts : [zero(ui32?) for _ in 0..256]
	for letter in string {
		counts[letter] +: 1
	}	
	str : [zero(char?) for _ in 0..256]
	ind : zero(i32)
	for char, count in enumerate(counts) { 
		while (count ≠ 0) { str[ind] : char }
	}
	return str
}


let sort_str(string string?) string?
	
	counts : [zero(ui32) for _ in 0..256]	
	for letter in string
		counts[letter] +: 1
	
	str : [zero(char) for _ in 0..256]	
	ind : zero(i32)
	for char, count in enumerate(counts)
		while count ≠ 0
			str[ind] : char

	return str
	
quota : begin
  quote
	something

quota : quote { something }

quota : quote { something; };

data : begin
  sql
	select * from data_frame
	where ... 

data : sql {
	select * from data_frame
	where ... 
}

data : sql {
	select * from data_frame
	where ... 
};


let fib(n i32) i32 {
	a i32 : 1
	b i32 : 0
	for _ 0..n { a, b : b, a+b }
	return b
}

fib(n i32) i32 : {
	a, b : 1, 0
	for _ 0..n { a, b : b, a+b }
	return b
}

fib(n i32) i32 : n < 2 ? n | fib(n-1) + fib(n-2)
fib(n i32) i32 : n if n < 2 else fib(n-1) + fib(n-2)
fib(n i32) i32 : n < 2 then n else fib(n-1) + fib(n-2)

let fib(n i32) i32
	a, b : 1, 0
	for _ 0..n
		a, b : b, a+b
	return b

fib(n i32) i32 : begin
	a, b : 1, 0
	for _ 0..n
		a, b : b, a+b 
	return b

fib : func(n i32) i32
	a, b : 1, 0
	for _ 0..n
		a, b : b, a+b
	return b


if pred {
	something
} pred2 {

} else {
	something
}


fib(n i32) i32 : {
	a : 0
	b : 1
	for i 0..n {
		a, b : b, a+b
	}
	return b
}

fib(n i32) i32 : n < 2 ? n | fib(n-1) + fib(n-2)

asdf : {
	s : 0
	for i 0..n {
		s +: 1/i
	}	
	return s
}

data : {sql select * from df
			where something } 

func : lambda(x) {
	x : x + 1
	return x
}


func(x i32) i32 : {
	for _ 0..n {
		x += i32(1)
	}
	return x
}

let func(x i32) i32
	for _ 0..n	
		x += i32(1) 
	return x

let foo(x @i32) @i32
	a : begin
		return x + x
	return a

let bar(df @data_frame) @string
	data : sql
		select name from df
		where value > 0
	return cat(data)


let fib(x i32) i32
	a, b : 0, 1
	for _ in 0..n 
		a, b : b, a+b
	return b	


 







	
