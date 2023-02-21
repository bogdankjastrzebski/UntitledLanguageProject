#include<iostream>
#include<string>

class A {
	public: 
		std::string* name; 

		A(std::string name) {
			this->name = new auto(name);
			std::cout << *(this->name) << " just showed up!" << std::endl;
		}
		A(const A& other) {
			std::cout << "Dumdum, copying " << *(other.name) << "...  ";
			// this->name = new auto(*(other.name));
			std::cout << "Done." << std::endl;
		}
		~A() {
			std::cout << "My name was: " << *(this->name) << std::endl;
			// delete this->name;
		}
		void change_name(std::string name) { 
			this->name = new auto(name); 
		}
		void say(std::string something) {
			std::cout << *(this->name) << ": " << something << std::endl;
		}
		void introduce_yourself() {
			std::cout << "My name is " << *(this->name) << "." << std::endl;
		}
};

A mad_hatter() {
	A mh("Mad Hatter");
	return mh;
}


A rabbit_hole(A white_rabbit, A alice) {
	alice.change_name("Alice (inside)");
	white_rabbit.change_name("White Rabbit (inside)");
	A mh = mad_hatter();
	white_rabbit.say("Oh no! I'm late!");
	alice.say("Curiouser and curiouser!");
	std::cout << "<exit rabbit hole>" << std::endl;
	return alice;
}

void quick_check(A alice) {
	std::cout << alice.name << std::endl;
	std::cout << *(alice.name) << std::endl;
}

int main() {
	A alice("Alice");
	A white_rabbit("White Rabbit (outside)");
	alice.introduce_yourself();
	alice.change_name("Alice (before)");
	alice.introduce_yourself();
	
	//std::cout << alice.name << std::endl;
	//std::cout << *(alice.name) << std::endl;
	//quick_check(alice);
	
	alice = rabbit_hole(white_rabbit, alice);
	alice.change_name("Alice (after)");
	std::cout << "This is the end..." << std::endl;
}
