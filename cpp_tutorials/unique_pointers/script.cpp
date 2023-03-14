#include<iostream>
#include<memory> 

class Task {
public:
	int id; 
	Task(int id) : id(id) {
		std::cout << "Start : " << this->id << std::endl; 
	}
	~Task() {
		std::cout << "End   : " << this->id << std::endl; 
	}
};

void foo(std::unique_ptr<Task>& task) {
	int id = task->id;
	std::cout << "foo    : " << id << std::endl;
}	

void bar(std::unique_ptr<Task> task) {
	int id = task->id; 
	std::cout << "bar    : " << id << std::endl;
}

int main() {

	auto task = std::make_unique<Task>(3);
	// auto copied = task; // Error 
	auto moved = std::move(task);
	// Task * released = moved.release();  // makes moved empty 

	if (task) { // Does not run. 
		int id = task->id; 
		std::cout << "Task  : " << id << std::endl; 
		foo(task);
	}
	if (moved) { // This runs.
		int id = moved->id; 
		std::cout << "Moved : " << id << std::endl; 			
		foo(moved);
	} 
	
	bar(std::move(moved));

	std::cout << "Done" << std::endl;
}




