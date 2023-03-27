#include<iostream>

int fib(int n) {
	int a = 1,
        b = 0, 
		c = 0;
	for (int i = 0; i < n; i++) {
		c = a; 
		a = b; 
		b += c; 
	}
	return b; 
}

constexpr int fib_expr(int n) {
	int a = 1,
        b = 0, 
		c = 0;
	for (int i = 0; i < n; i++) {
		c = a; 
		a = b; 
		b += c; 
	}
	return b; 
}

consteval int fib_eval(int n) {
	int a = 1,
        b = 0, 
		c = 0;
	for (int i = 0; i < n; i++) {
		c = a; 
		a = b; 
		b += c; 
	}
	return b; 
}

consteval int foo(int n) {
	return 2*n;
}

int main() {

	int fib10 = fib(10); 
	const int fib11 = fib(11); 
	// constexpr int fib12 = fib(12); // must be initialized by a constant expression. 
	// constinit static int fib19 = fib(19); 	

	int fib13 = fib_expr(13); 
	const int fib14 = fib_expr(14); //this
	constexpr int fib15 = fib_expr(15);	//this
	constinit static int fib20 = fib_expr(1); 	
	
	int fib16 = fib_eval(16); //this 
	const int fib17 = fib_eval(17); //this 
	constexpr int fib18 = fib_eval(18); //this
	constinit static int fib21 = fib_eval(1); //this	

	std::cout << 10 << " " << fib10 << std::endl;
	std::cout << 11 << " " << fib11 << std::endl;
//	std::cout << 12 << " " << fib12 << std::endl;
	std::cout << 13 << " " << fib13 << std::endl;
	std::cout << 14 << " " << fib14 << std::endl;
	std::cout << 15 << " " << fib15 << std::endl;
	std::cout << 16 << " " << fib16 << std::endl;
	std::cout << 17 << " " << fib17 << std::endl;
	std::cout << 18 << " " << fib18 << std::endl;	
	//std::cout << 19 << " " << fib19 << std::endl;
	std::cout << 20 << " " << fib20 << std::endl;
	std::cout << 21 << " " << fib21 << std::endl;
	
	int       foo0 = foo(47);    // 
	const int foo1 = foo(48);    //	
	constexpr int foo2 = foo(49);//
	
	
	int a0 = foo0 * 100; //runtime		
	int a1 = foo1 * 100; //comptime 	
	int a2 = foo2 * 100; //comptime 	
	
	int b0 = a0 * 13; //runtime 		
	int b1 = a1 * 13; //runtime	
	int b2 = a2 * 13; //runtime	
	
	// std::cout << a << std::endl;	
	std::cout << foo0 * 1000 << std::endl;	
	std::cout << foo1 * 1000 << std::endl;	
	std::cout << foo2 * 1000 << std::endl;		
		
}







