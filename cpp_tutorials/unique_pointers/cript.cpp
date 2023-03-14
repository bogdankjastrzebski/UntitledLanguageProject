#include<iostream> 
#include<memory> 

template <typename T>
struct Node {
	T head; 
	std::unique_ptr<Node<T>> tail; 
	Node(T head, std::unique_ptr<Node> tail) : head(head), tail(std::move(tail)) {
		std::cout << "Init: " << this->head << std::endl; 
	}
	~Node() {
		std::cout << "Delt: " << this->head << std::endl; 
	}
};

template <typename T>
class List {
	std::unique_ptr<Node<T>> head; 
	int length; 
public:
	List() {
		std::cout << "List created" << std::endl; 	
	}
	~List() {
		std::cout << "List destroyed" << std::endl;
	}
	void push(T value) {
		this->head = std::make_unique<Node<T>>(value, std::move(this->head));
	}
	T pop() {
		if (this->head) {
			T ret_val = this->head->head;
			this->head = std::move(this->head->tail);
			return ret_val;
		} else {
			throw 1111;
		}
	}
};


int main() {
	auto list = std::make_unique<List<int>>();
	list->push(0); 
	list->push(1);
	list->push(2);
	
	if (false) 
		for (int i = 0; i < 4; i++) {
			try {
				std::cout << list->pop() << std::endl; 
			} catch (int error) {
				std::cout << "Error code: " << error << std::endl; 
			}
		}
}






