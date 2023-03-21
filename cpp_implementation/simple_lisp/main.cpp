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
	Error 	
};

enum ErrorTypes { // These are compiler errors. 
	IncorrectTypeError,	
};

// Primitive Lisp Types

struct LispSymbol {
	std::string symbol;
};

struct LispCons { 
	LispObject *head; 
	LispObject *tail; 
};

struct LispInt {
	int value;	
};

struct LispFloat {
	float value; 
};

struct LispString {
	std::string value; 
};

struct LispLambda {
	LispObject *args; 
	LispObject *code;	
};

struct LispError {
	std::string message;	
};

// Lisp Objects

class LispObject {
	LispType type; // Type Identifier 	
	void *value;   // Primitive Type
	
public:
	LispObject(         int value ) : type(   Int), value(&value) {}; 
	LispObject(       float value ) : type( Float), value(&value) {}; 
	LispObject( std::string value ) : type(String), value(&value) {}; 
	LispObject(    LispCons value ) : type(  Cons), value(&value) {}; 
	LispObject(  LispLambda value ) : type(Lambda), value(&value) {};
	LispObject(   LispError value ) : type( Error), value(&value) {}; 	
		
	LispType get_type() { return this->type; };		

	int* as_int() {
		if (this->type != Int) {
			throw IncorrectTypeError;
		return (int *)this->value;
	}
		
	float* as_float() {
		if (this->type != Float)
			throw IncorrectTypeError; 
		return (float *)this->value;
	}
	
	std::string* as_string() {
		if (this->type != String)
			throw IncorrectTypeError; 
		return (std::string *)this->value;
	}

	LispCons* as_cons() {
		if (this->type != Cons)
			throw IncorrectTypeError;
		return (LispCons *)this->value;
	}

	LispLambda* as_lambda() {
		if (this->type != Lambda)
			throw IncorrectTypeError;
		return (LispLambda *)this->value; 
	}

	LispError* as_error() {
		if (this->type != Error)
			throw IncorrectTypeError;
		return (LispError *)this->value;
	}	

	
};

class LispEnvironment {
	LispObject *symbol; 
	LispObject *value;		
 	LispEnvironment *next;

public:
	LispEnvironment(LispObject *symbol,
					LispObject *value,
					LispEnvironment *next) : symbol(symbol), value(value), next(next) {
		if (symbol.get_type() != Symbol)
			throw IncorrectTypeError;
	} 
	LispObject* get_value(LispObject &symbol) {
		if (symbol.get_symbol() == this->symbol->get_symbol()) {
			return this->value; 
		} else if (next) {
			return this->next->get_value(); 
		} else {
			return *LispObject(new LispError("Symbol " + symbol.get_symbol() + " not defined."));
		}	
	}	
};


/* enum LispType {
	Symbol,
	Cons, 
	Int, 
	Float,
	String,
	Lambda,
	Error 	
}; */

LispObject* eval(LispObject* code, LispEnvironment* env) {
	switch code.get_type() { 
		case Int: 
			auto value = code->as_int();
 
		case Cons: 
			auto value = code->as_cons(); 
			auto rator = eval(cons->head, env)->as_lambda();
			auto rands = eval(cons->tail, env)->as_cons(); 	
									    
			break; 
		case Symbol:
			auto value = code->as_symbol();
			return env->get_value(value);
		default: 
			break;	
	}
}


