#include <iostream> 

class Box {
	int value; 
public: 
	Box(int value) : value(value) {
		std::cout << "Creating box: " << value << std::endl;
	}
	Box(Box &b) {
		std::cout << "Copying: " << b.value << std::endl;
		this->value = b.value;
	}
	~Box() {
		std::cout << "Destroying box: " << value << std::endl;	
	} 
	int get_value() {
		return value;
	}
};

void foo(Box &a) {
	std::cout << "Inside foo: " <<  a.get_value() << std::endl;
}

void dereference_inside(Box* a) {
	Box b = *a;
	std::cout << "end deref" << std::endl;
}

struct A {
	int a; 
};

int main() {
	//int original = 3;
	//void* value = &original; 
	
	// std::cout << *value << std::endl;
	
	//int *as_int = (int *)value;
	//std::cout << *as_int << std::endl;	
	

	// Box a(3);
	// foo(&a);  

	Box* a = new Box(3);
		
	std::cout << "here" << std::endl;
	
	Box b = *a;
	// Box b = *a; 			
	
	std::cout << "Done." << std::endl;

	dereference_inside(a);
	
	std::cout << "Done." << std::endl;
	
	std::cout << a->get_value() << std::endl;		

	
	std::cout << "sizeof(A): " << sizeof(A) << std::endl;
	std::cout << "sizeof(int): " << sizeof(int) << std::endl;	
}






