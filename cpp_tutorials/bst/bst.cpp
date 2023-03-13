#include<iostream>

class BSTNode {
	int value; 
	BSTNode *gt; 
	BSTNode *lt;
	public:
		BSTNode(int value) {
			this->value = value;
		}
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
		BSTNode* find(int value) {
			if (this->value < value)
				return this->gt ? this->gt->find(value) : nullptr; 
			if (this->value > value) 
				return this->lt ? this->lt->find(value) : nullptr;
			return this; 	
		}
		BSTNode* find_min() {
			if (this->lt)
				return this->lt->find_min(); 
			return this; 
		}
		BSTNode* find_max() {
			if (this->gt) 
				return this->gt->find_max(); 
			return this; 
		}
		void remove(int value) {

			auto node = this->find(value); if (!node) return; 			
		
			if (node->gt) {
				auto repl_node = node->gt->find_min();
				auto repl_value = repl_node->value;
				if (auto repl_node_gt = repl_node->gt) {
					repl_node->value = repl_node_gt->value; 
					repl_node->gt    = repl_node_gt->gt; 
					repl_node->lt    = repl_node_gt->lt; 
					delete repl_node_gt;
				}
				this->value = repl_value;
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
				this->value = repl_value; 
				return; 
			}	
		}
};

int main() {
	auto bst = new BSTNode(0);
	for (auto e : {-3,2,-2,-1,2,-3,4,-4}) {
		bst->insert(e); 
	}
	bst->remove(-1); 
	bst->remove(-3);
	std::cout << "Done" << std::endl; 
}

