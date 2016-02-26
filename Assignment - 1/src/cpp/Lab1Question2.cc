

#include<iostream>
#include<stdio.h>
#include <math.h> 

using namespace std;

float f1(float x,float y,float z)
{
    return(z);
}
float f2(float x,float y,float z)
{
    return(y);
}

float shoot(float y0,float z0,float h){
	float x,y,z,k1,k2,k3,k4,l1,l2,l3,l4,k,l,x1,y1,z1;

	x = 0;
	y = y0;
	z = z0;

	for(int i=1;i<=10;i++){
		k1=h*f1(x,y,z);
        l1=h*f2(x,y,z);
        k2=h*f1(x+h/2.0,y+k1/2.0,z+l1/2.0);
        l2=h*f2(x+h/2.0,y+k1/2.0,z+l1/2.0);
        k3=h*f1(x+h/2.0,y+k2/2.0,z+l2/2.0);
        l3=h*f2(x+h/2.0,y+k2/2.0,z+l2/2.0);
        k4=h*f1(x+h,y+k3,z+l3);
        l4=h*f2(x+h,y+k3,z+l3);
        l=1/6.0*(l1+2*l2+2*l3+l4);
        k=1/6.0*(k1+2*k2+2*k3+k4);
        y1=y+k;
        x1=x+h;
        z1=z+l;
        x=x1;
        y=y1;
        z=z1;
    }
    return (y + 1.0);

}
int main(){
	float y0, y1, z0, h, a1, a2, temp, a ,b, z1;
	y0 = 0;
	y1 = -1;
	z0 = 0.3;
	a1 = 0.3;
	a2 = 0.4;
	h = 0.1;
	a = shoot(y0,z0,h);

	while(fabs(a1 - a2) > 0.000005){
		z1 = a2;
		b = shoot(y0, z1, h);
		temp = a1 - ((a2 - a1) / (b - a)) * a;
		a1 = a2;
		a2 = temp;
		a = b;
	}
	cout << "Value of alpha" << endl;
	printf("%f\n", a2);


	float x,y,z,k1,k2,k3,k4,l1,l2,l3,l4,k,l,x1;
	x = 0;
	y = y0;
	z = a2;

	for(int i=1;i<=10;i++){
		k1=h*f1(x,y,z);
        l1=h*f2(x,y,z);
        k2=h*f1(x+h/2.0,y+k1/2.0,z+l1/2.0);
        l2=h*f2(x+h/2.0,y+k1/2.0,z+l1/2.0);
        k3=h*f1(x+h/2.0,y+k2/2.0,z+l2/2.0);
        l3=h*f2(x+h/2.0,y+k2/2.0,z+l2/2.0);
        k4=h*f1(x+h,y+k3,z+l3);
        l4=h*f2(x+h,y+k3,z+l3);
        l=1/6.0*(l1+2*l2+2*l3+l4);
        k=1/6.0*(k1+2*k2+2*k3+k4);
        cout << "value of Y = " << y <<" and Y’ = "<< z << " at X = "<< x << endl;
        y1=y+k;
        x1=x+h;
        z1=z+l;
        x=x1;
        y=y1;
        z=z1;
    }
    cout << "value of Y = " << y <<" and Y’ = "<< z << " at X = "<< x << endl;

	return 0;

}