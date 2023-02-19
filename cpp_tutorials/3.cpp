#include<iostream>

template <class T>
class Node {
	public:
		T value;
		Node<T> *next;
		Node(T value, Node<T> *next);
};

template <class T> 
Node<T>::Node(T value, Node<T> *next) {
	this->value = value;
	this->next = next;
}

template <class T>
class LinkedList {
	private:
		Node<T> *head;
	public:
		int length;
		void push(T value);
        auto pop();
		auto get_item(int index);
		LinkedList();
};

template <class T>
LinkedList<T>::LinkedList() {
	this->length = 0;
}

template <class T>
void LinkedList<T>::push(T value) {
	auto old_head = this->head;
	this->head = new Node<T>(value, old_head);
	this->length++;
}

template <class T>
auto LinkedList<T>::pop() {
	
	auto old_head = this->head;

	this->head = old_head->next;
	this->length--;
	
	auto ret = old_head->value;
	free(old_head);
	return ret;
}

template <class T> 
auto LinkedList<T>::get_item(int index) {
	auto current = this->head; 	
	for (int i = 0; i < index; i++) {
		current = current->next;
	}
	return current->value;
}

int main() {
	LinkedList<int> ll;
	ll.push(1);
	ll.push(2); 
	ll.push(3);
	ll.push(4);
	std::cout << ll.pop() << std::endl;
	std::cout << ll.get_item(0) << std::endl;
	std::cout << ll.get_item(1) << std::endl;
	std::cout << ll.get_item(2) << std::endl;
}
