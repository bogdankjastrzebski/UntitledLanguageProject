#include <stdio.h>


typedef struct Symbol Symbol;
typedef struct Nil    Nil;
typedef struct Cons   Cons;
typedef struct Lambda Lambda;
typedef struct Object Object;


struct Symbol {
    char* value;
};

struct Nil {}; 
struct Cons {
    Object car;
    Object cdr;
};

struct Lambda {

};

enum Type {
    INT,
    FLOAT,
};

union Data {
    int INT;
    float FLOAT;
};

struct Object {
    enum Type type;
    union Data data;
};

struct Object square(struct Object arg) {
    struct Object result;
    switch (arg.type) {
        case INT:
            result.type = INT;
            result.data.INT = arg.data.INT * arg.data.INT;
            break;
        case FLOAT:
            result.type = FLOAT;
            result.data.FLOAT = arg.data.FLOAT * arg.data.FLOAT;
            break;
    }
    return result;
}

int main() {
    union Data data; data.INT = 3;
    struct Object obj = {INT, data};
    struct Object res = square(obj);
    printf("%d\n", res.data.INT);
}
