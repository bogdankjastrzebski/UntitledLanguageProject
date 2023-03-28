#include <iostream> 

struct Node {
	int value; 
};

Node* foo(int value) {
	auto node = Node{ .value = value };
	return &node; 	
}

int main() {
	auto a = foo(123);
	foo(321); // Without Worning
	std::cout << a->value << std::endl;
}


