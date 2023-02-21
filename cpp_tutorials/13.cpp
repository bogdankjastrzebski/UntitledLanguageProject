#include <iostream>

using namespace std;

class A {
    public: 
        string *name;
        A(string name) {
            this->name = new auto(name);
        }
};


void quick_check(A a) {
    cout << *(a.name) << endl;
}


int main()
{
    A a("A");
    
    cout<<*(a.name)<<endl;
    quick_check(a);
    
    return 0;
}
