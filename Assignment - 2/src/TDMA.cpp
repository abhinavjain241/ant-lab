#include <cstdio>

int main(){
	double y[21]; // Instantiate array of 21 values which will hold y
	double h = 0.05; // Set value of h 
	double a[21] ,b[21] ,c[21] ,d[21]; //For the coefficients
	double x[21]; //For different x
	x[0] = 0.0;
	for(int i = 1; i <= 20; i++) {
		x[i] = x[i-1] + h;
	}
	for(int i = 1; i <= 19; i++) {
		if(i == 1) {
			a[i] = 0.0;
			b[i] = (-1.0)*((2/(double(h * h)))+2.0)+((1/(double(h * h)))+(x[i]/double(h)))*(1/(double(1+h+h * h)));
			c[i] = ((1/(double(h * h)))-(x[i]/double(h)));
			d[i] = (4*x[i]*(-1.0));
		} else if(i == 19) {
			c[i] = 0.0;
			a[i] = 1/(double(h * h))+x[i]/double(h);
			b[i] = (-1.0)*((2/(double(h * h)))+2.0)+((2/double(h * h))/(double)(6.0-4.0/double(h)+2.0/(double(h * h))))*(1/(double(h * h))-x[i]/double(h));
			d[i] = (4*x[i]*(-1.0))+((2*(1-h)/double(h)-4.0)/(double)(6.0-4.0/double(h)+2.0/(double(h * h))))*(1/(double(h * h))-x[i]/double(h));
		} else {
			a[i] = 1/(double(h * h))+(x[i]/double(h));
			b[i] = (-1.0)*((2/(double(h * h)))+2.0);
			c[i] = ((1/(double(h * h)))-(x[i]/double(h)));
			d[i] = (4*x[i]*(-1.0));
		}
	}
	double ro[20], gam[20];
	for(int i = 1;i <= 19; i++){
		if(i == 1){
			gam[i] = (c[i]/(double)(b[i]));
			ro[i] = (d[i]/(double)(b[i]));
		}
		else {
			gam[i] = (c[i]/(double)(b[i]-a[i]*gam[i-1]));
			ro[i] = ((d[i]-a[i]*ro[i-1])/(double)(b[i]-a[i]*gam[i-1]));
		}
	}
	for(int i = 19; i>=1 ; i--){
		if(i == 19){
			y[i] = ro[i];
		}
		else{
			y[i] = (ro[i]-gam[i]*y[i+1]);
		}
	}
	y[0] = y[1] * (1/(double(1+h+h * h)));
	y[20] = ((2*(h-1)/double(h)+4.0)+y[19]*(2/double(h * h)))/(double(6.0-4.0/double(h)+2.0/(double(h * h))));
	for(int i = 0;i <= 20; i++){
		printf("%lf, %lf\n", x[i], y[i]);
	}
	return 0;
}
