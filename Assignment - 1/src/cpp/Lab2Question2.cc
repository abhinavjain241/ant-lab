#include<iostream>
#include<cmath>
#include<vector>

using namespace std;


void thomas_algorithm(double a[21],
                      double b[21],
                      double c[21],
                      double d[21],double y[21]){

	int i;
	c[1] /= b[1];
	d[1] /= b[1];

	for(i = 2; i <= 19; i++){
		c[i] /= b[i] - a[i] * c[i -1];
		d[i] = (d[i] - a[i]*d[i-1]) / (b[i] - a[i]*c[i-1]);
	}

	y[19] = d[19];
	for (i = 18 ; i > 0; i--) {
    	 y[i] = d[i] - c[i] * y[i+1];
  	}
}

int main(){
	double h;
	int i;
	h = 0.025;
	double a[21], b[21], c[21], d[21], y[21], x[21];
	y[0] = 1;
	y[20] = 1.279;
	x[0]=0.0;
	for(int i=1;i<=20;i++){
		x[i]=x[i-1]+h;
	}

	for(i = 2; i <= 19; i++){
		a[i]= 1 /(h * h) - x[i] / (h);
	}
	a[1] = 0.0;

	for(i = 1; i <= 19; i++){
		b[i]=(-2.0) * ((1 / (h * h)) - 1.0);
	}

	for(i = 1; i <= 18; i++){
		c[i]=((1 / (h * h )))+(x[i] / (h));
	}
	c[19] = 0;

	for(i = 1; i <= 19; i++){
		if(i == 1)
			d[i]=4 * x[i] - y[i-1] / ((h * h)) + ((y[i-1] * x[i]) / (h));
	else if(i==19)
		d[i]=(4 * x[i] - y[i+1]*((1 / ((h*h))) + x[i] / (h)));
	else
		d[i]=(4*x[i]);
	}

	thomas_algorithm(a, b, c, d, y);

	for( i = 0; i <= 20; i++){
		cout << y[i] << endl;
	}

	return 0;

}