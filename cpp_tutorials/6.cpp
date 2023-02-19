#include<iostream> 

template <typename T>
void print(T value) {
	std::cout << value << std::endl;
}

template <typename T, typename... Args>
void print(T value, Args... args) {
	std::cout << value << ' ';  
	print(args...); 
}

int main() {
	print("a", "b", 2, 4, 'a');
}
