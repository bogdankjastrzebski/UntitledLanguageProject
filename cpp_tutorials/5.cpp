#include<iostream> 
#include<string>

class MyClass {
	std::string name; 
	public:
		MyClass(std::string name) {
			std::cout << "here: " << name << std::endl;
			this->name = name;
		};
		~MyClass() {
			std::cout << "there: " << name << std::endl; 
		};
};

int main() {
	MyClass a("Kuba");
	auto b = new MyClass("Buba");
	std::cout << "hello" << std::endl;
	delete b;
};

