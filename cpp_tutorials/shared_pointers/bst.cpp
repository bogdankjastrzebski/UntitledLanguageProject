#include<iostream>

class BSTNode {
	int value; 
	BSTNode *gt; 
	BSTNode *lt;
public:
	void insert(int value) {
		if (this->value < value) {
			if (this->gt) {
				this->gt->insert(value);
			} else {
				this->gt = new BSTNode(value); 
			}
		} else if (this->value > value) {
			if (this->lt) {
				this->lt->insert(value); 
			} else {
				this->lt = new BSTNode(value); 
			}
		}
	}
	BSTNode(int value) {
		this->value = value;
	}
	BSTNode** find(int value) {
		if (this->value < value)
			return this->gt ? this->gt->find(value) : nullptr; 
		if (this->value > value) 
			return this->lt ? this->lt->find(value) : nullptr;
		return &this; 	
	}
	BSTNode** find_min() {
		if (this->lt)
			return this->lt->find_min(); 
		return &this; 
	}
	BSTNode** find_max() {
		if (this->gt) 
			return this->gt->find_max(); 
		return &this; 
	}
	void remove(int value) {
		std::cout << "start removal " << value << " | head value " << this->value << std::endl;
		auto node = this->find(value); 
		if (!node) {
			std::cout << value << " not found" << std::endl; 
			return;
		}

		if (node->gt) {
			auto repl_node = node->gt->find_min();
		auto repl_value = repl_node->value;
			std::cout << "repl_value " << repl_value << std::endl;
			if (auto repl_node_gt = repl_node->gt) {
				repl_node->value = repl_node_gt->value; 
				repl_node->gt    = repl_node_gt->gt; 
				repl_node->lt    = repl_node_gt->lt; 
				delete repl_node_gt;
			}
			node->value = repl_value;
			return; 
		}	

		if (node->lt) {
			auto repl_node = node->lt->find_max();
			auto repl_value = repl_node->value;
			if (auto repl_node_lt = repl_node->lt) {
				repl_node->value = repl_node_lt->value; 
				repl_node->gt    = repl_node_lt->gt; 
				repl_node->lt    = repl_node_lt->lt; 
				delete repl_node_lt;
			}
			node->value = repl_value; 
			return; 
		}
		
		delete node;
				
	}
	
	int get_value() {
		return this->value;
	}
};

int main() {
	auto bst = new BSTNode(0);
	for (auto e : {0,2,-2,-3,-1,1,3}) {
			bst->insert(e);
	}
	std::cout << bst->get_value() << std::endl;
	if (bst->find(0)) 
		std::cout << "0 in bst" << std::endl;
	
	if (auto node = bst->find(1)) 
		std::cout << node->get_value() << " in bst" << std::endl;
	if (bst->find(4))
 		std::cout << "4 in bst" << std::endl;
	
	bst->remove(1); 
	bst->remove(0);

	if (bst->find(1)) 
		std::cout << "1 in bst" << std::endl;
	if (bst->find(4))
		std::cout << "4 in bst" << std::endl;
	
	std::cout << "Done" << std::endl;

}
