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
		T get_item(int index);
		void push(T value);
        T pop();
		LinkedList();
};

template <class T>
LinkedList<T>::LinkedList() {
	this->length = 0;
}

template <class T>
void LinkedList<T>::push(T value) {
	Node<T> *old_head = this->head;
	this->head = new Node<T>(value, old_head);
	this->length++;
}

template <class T>
T LinkedList<T>::pop() {
	
	Node<T> *old_head = this->head;

	this->head = old_head->next;
	this->length--;
	
	T ret = old_head->value;
	delete old_head;
	return ret;
}

template <class T> 
T LinkedList<T>::get_item(int index) {
	Node<T> *current = this->head; 	
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
