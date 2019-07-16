#include <iostream>
using namespace std;
extern "C" double objetosc(double,double,double,double);
int main()
{
	double H=20.0, L=15.0, D=8.0, y=0.5;
	//cin >> H >> L >> D >> y;
	double wynik = objetosc(H, L, D, y);
	cout << wynik;
	return 0;
}