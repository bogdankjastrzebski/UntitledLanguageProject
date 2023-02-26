#include<iostream> 

void swap_ints(int& a, int& b) {
	int temp = a; 
	a = b; 
	b = temp;
}

int main() {
	int a = 0, b = 1; 
	std::cout << a << b << std::endl; 
	swap_ints(a, b); 
	std::cout << a << b << std::endl;
}

