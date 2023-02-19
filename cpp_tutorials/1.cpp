#include<iostream>

int main() {
	int a;
	{
		int b = 3; 
		a = 2*b;
	};
	std::cout << a << std::endl;
	// std::cout << b << std::endl; This does not work 
};
