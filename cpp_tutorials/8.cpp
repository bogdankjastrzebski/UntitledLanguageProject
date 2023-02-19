#include<iostream>



int main() {
	//auto f = [](float a, float b) {return a + b; }; 
	auto f = []<typename T>(T a, T b) {return a + b; };
	std::cout << f(3.2, 3.2) << std::endl;
}




