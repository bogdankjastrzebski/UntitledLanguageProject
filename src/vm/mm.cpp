#include<iostream>
using std::cout;
using std::endl; 

class Matrix {
	public:
		int **values;
		int nrows;
		int ncols;
		int get_item(int row, int col);
		Matrix(int nrows, int ncols) {
			int temp[nrows][ncols];
			for (int i = 0; i < nrows; i++) {
				for (int j = 0; j < ncols; j++) {
					temp[i][j] = 0
				}
			}
			values = &temp;
			nrows = nrows;
			ncols = ncols;
		}
};

int Matrix::get_item(int row, int col) {
	return 
}

int main() {

}


