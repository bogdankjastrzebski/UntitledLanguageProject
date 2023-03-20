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

enum ErrorTypes {
	IncorrectTypeError,	
}

struct LispCons {
	LispObject *head; 
	LispCons *tail; 
};

struct LispLambda {
	LispObject* args;  
	LispObject* code;	
};

struct LispError {
	LispObject* message;	
};

struct LispSymbol {
	std::string symbol;
};

class LispObject {
	LispType type; 	
	void *value;
	
public:
	LispObject(int value)         : type(Int),    value(&value) {}; 
	LispObject(float value)       : type(Float),  value(&value) {}; 
	LispObject(std::string value) : type(String), value(&value) {}; 
	LispObject(LispCons value)    : type(Cons),   value(&value) {}; 
	LispObject(LispLambda value)  : type(Lambda), value(&value) {};
	LispObject(LispError value)   : type(Error),  value(&value) {}; 	
		
	LispType get_type() { return this->type; };		
	LispCons as_cons() {
		return *(LispCons *)this->value;
	}
	LispLambda as_lambda() {
		return *(LispLambda *)this->value; 
	}
	LispError as_error() {
		return *(LispError *)this->value;
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


LispObject eval(LispObject &code, LispEnvironment &env) {
	switch code.get_type() { 
		case Cons: 
			auto value = code.as_cons(); 
			auto rator = eval(cons.head, env).as_lambda(); 
			auto rands = eval(cons.tail, env).as_cons(); 	
						    
			break; 
		case Symbol:
			auto value = code.as_symbol();
			return env.get_value(value);
		default: 
			break;	
	}
}






