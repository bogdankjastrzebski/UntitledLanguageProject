#include<iostream>
#include<vector>
#include<map>

int main() {
	int arr[2]; 
	arr[0] = 0;
	arr[1] = 100; 
	for (auto e : arr) {
		std::cout << e << std::endl;
	}; 	

	std::cout << "------------------------" << std::endl;

	std::vector<int> vec;
	std::cout << vec.capacity() << std::endl;
	vec.push_back(0); 
	vec.push_back(100);
	std::cout << vec.capacity() << std::endl;
	for (int i = 0; i < 10; i++ ) {
		vec.push_back(i); 
		std::cout << vec.capacity() << std::endl;	
	};
	for (int i = 0; i < 10; i++ ) {
		vec.pop_back();
		std::cout << vec.capacity() << std::endl;
	}; 
	vec.shrink_to_fit(); 
	std::cout << vec.capacity() << std::endl;

	std::cout << "------------------------" << std::endl;
	
	std::map<std::string, int> map;
	
	map["a"] = 1; 
	map["b"] = 2; 

//	for (auto it = map.begin(); it != map.end(); it++) {
//		std::cout << it->first << ", " << it->second << std::endl;
//	};
	
	for (auto &pair : map) {
		std::cout << pair.first << std::endl;
	};


	//if (map.find("c") != map.end()) {
	//	std::cout << "C in map" << std::endl;
	//} else {
	//	std::cout << "C not in map" << std::endl;
	//}
	std::cout << (map.find("c") != map.end() ? "C in map" : "C not in map" ) << std::endl;	

};


