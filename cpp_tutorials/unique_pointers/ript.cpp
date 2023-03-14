#include <iostream> 
#include <memory> 
	
struct CustomString {
	std::string value; 
	CustomString(std::string value) : value(value) {
		std::cout << "CREATE: " << this->value << std::endl; 	
	}
	~CustomString() {
		std::cout << "DELETE: " << this->value << std::endl; 
	}
	CustomString(CustomString&& str) {
		std::cout << "MOVE  : " << str.value << std::endl; 
		this->value = std::move(str.value); 
	}
	void print() {
		std::cout << "PRINT : " << this->value << std::endl; 
	}
	void append(std::string str) {
		this->value.append(str);
	}
};

void eat(CustomString str) {
	std::cout << "INSIDE EAT" << std::endl;
	str.append(">>APPENDED");
	str.print();
	std::cout << "EAT END" << std::endl;	
}

int main() {
	
	CustomString str("Hello!");
	auto rts = std::move(str);
	
	eat(std::move(str)); 
		
	str.print(); 
	rts.print(); 	


/* 	
	std::string str = "Hello!";
	std::string rts = std::move(str);

	std::cout << str << std::endl; // changes to "" 
	std::cout << rts << std::endl;
*/ 
/*	
	auto str = new std::string("Hello!"); 
	auto rts = std::move(str);
	if (str) {
		std::cout << *str << std::endl; 
	}
	if (rts) {
		std::cout << *rts << std::endl; 
	} 
*/ 
 
}
