#include<iostream>

constexpr int a = 7; 

consteval int foobar(int a, int b) {
	return a + b*a ; 
}

int main() {
	a += 1;
	const int c = foobar(a, a);
	return c;
}




