#include<iostream>
#include<string>

template <typename T> 
class NamedLambda {
	private:
		std::string name;
		T *lambda; 
	public:
		NamedLambda(std::string name, T *lambda) {
			this->name = name;
			this->lambda = lambda; 
		};
		 
		template <typename A>
		auto operator()(A arg) {
			std::cout << "My name is: " << this->name << std::endl;
			return (*this->lambda)(arg);
		};
};

int main() {
	
	// Here we do not know, where to deallocate the lambda!
	// NamedLambda f("fooooo", new auto([]<typename T>(T a){return a + a;}));
	
	// I propose like this:
	auto func = new auto([]<typename T>(T a){return a + a;});
	NamedLambda f("fooooo", func);

	auto ret = f(3);	

	std::cout << ret << std::endl; 
	delete func;
};

