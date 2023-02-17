#include<iostream>
using std::cout;
using std::endl;

int fib (int n) {
	int a = 1, b = 0, c;
	for (int i = 0; i < n; i++) {
		c = a;
		a = b; 
		b = c + b;
	}
	return b; 
}

int main()
{
	for (int i = 0; i < 10; i++) {
		cout << "Number: " << i << " | " << fib (i) << endl;
	}
}





