#include <iostream> 

class Box {
	int value; 
public: 
	Box(int value) : value(value) {}; 
	int get_value() {
		return value;
	}
};

void foo(Box &a) {
	std::cout << "Inside foo: " <<  a.get_value() << std::endl;
}

int main() {
	//int original = 3;
	//void* value = &original; 
	
	// std::cout << *value << std::endl;
	
	//int *as_int = (int *)value;
	//std::cout << *as_int << std::endl;	
	Box a(3);
	foo(&a);  
}
