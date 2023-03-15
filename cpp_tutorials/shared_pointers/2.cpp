#include <iostream>
#include <memory>

struct QueueNode {
	int value;
	std::shared_ptr<QueueNode> next; 
	QueueNode(int value, std::shared_ptr<QueueNode> next) : value(value), next(next) {
		std::cout << "create: " << this->value << std::endl;
	}
	~QueueNode() {
		std::cout << "delete: " << this->value << std::endl;
	}
};

class Queue {
	std::shared_ptr<QueueNode> start;
	std::shared_ptr<QueueNode> end;
public:
	Queue() {
		this->start = nullptr; 
		this->end = nullptr; 
		std::cout << "Queue Created" << std::endl;
	} 
	~Queue() {
		std::cout << "Queue Deleted" << std::endl;
	}	
	void push(int value) {
		if (!this->end) {
			std::cout << "I'm creating the first node" << std::endl;
			this->end = std::make_shared<QueueNode>(value, nullptr);
		 	this->start = this->end;
		} else {
			this->end->next = std::make_shared<QueueNode>(value, nullptr);
			this->end = this->end->next;	
		}
	}	
	int pop() {
		if (!this->start) throw 1234;
		int ret = this->start->value;
		if (this->start == this->end) {
			// this->start = nullptr; 
			this->end = nullptr;
			return ret; 
		}
		//std::cout << "afterpop: " << (bool) this->start->next << " : " << this->start->next->value << std::endl;
		this->start = this->start->next;
		return ret;
	}
};

int main() {
	auto queue = std::make_unique<Queue>(); 
	
	for (int i : {0, 1, 2, 3, 4})
		queue->push(i); 
	
	int i = 0; 	
	while (i < 7) {
		try {
			std::cout << "Pop: " << queue->pop() << std::endl;	
		} catch (int error) { 
			std::cout << "Error: " << error << std::endl;
			break;
		};
		i++;
	}
	
}
