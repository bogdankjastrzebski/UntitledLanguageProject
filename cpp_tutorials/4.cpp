#include<iostream>

class Calculator {
  public:
	template <typename T>
	T sum(T a, T b) {
		std::cout << "here" << std::endl;
		return a + b;
	};

	template <typename A, typename B>
	auto sum(A a, B b) {
		std::cout << "there" << std::endl;
		return a + b; 
	} 
	
	int sum(int a, int b) {
		return a + b + 1; 
	};

};

int main() {
	Calculator c; 
	int   a = 1;
	float b = 1.1;
	std::cout << c.sum(a, a) << std::endl;
	std::cout << c.sum(b, b) << std::endl;
    std::cout << c.sum(a, b) << std::endl;
};


