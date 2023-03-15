#include<iostream> 
#include<memory>

class Task {
	int id;
public: 
	Task(int id) : id(id) {
		std::cout << "created: " << id << std::endl; 
	}
	~Task() {
		std::cout << "deleted: " << id << std::endl;
	}
	void print() {
		std::cout << "print  : " << id << std::endl;
	}
	void increment() {
		this->id += 1;
	}
}; 

void func(std::shared_ptr<Task> t) {
	std::cout << "func: begin" << std::endl;
	t->increment();
	t->print();
	std::cout << "func: end" << std::endl;	
}

int main() {
	auto t = std::make_shared<Task>(0);
	auto k = t; 
	t->print();
	k->print();
	func(t); 
	func(k);
	t->print();
	k->print(); 	
}



