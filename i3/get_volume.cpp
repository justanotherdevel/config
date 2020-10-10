#include <iostream>
#include <cstdlib>

using namespace std;

int main (int argc, char* argv[]) {
	int x = atoi(argv[1]);
	cout << (double)x/153*100;
	return 0;
}
