#include <iostream>
#include <memory>
#include <string> 

enum LispType {
	Symbol,
	Cons, 
	Int, 
	Float,
	String,
	Lambda, 	
}

struct LispCons {
	LispObject *value; 
	LispCons *next; 
}

struct LispLambda {
	LispObject code; 
	
}

class LispObject {
	LispType type; 	
	void *value;	
public:
	LispObject(int value) : type(Int),  value(&value) {}; 
	LispObject(float value) : type(Float), value(&value) {}; 
	LispObject(std::string value) : type(String), value(&value) {}; 
	LispObject(LispCons value) : type(Cons), value(&value) {}; 
	LispObject(	LispObject code; 
	
}



