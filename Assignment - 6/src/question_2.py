import numpy as np
import math
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = fig.gca(projection='3d')

dx=0.2
r=1.0
start=0.0
end=1.0
n=int((end-start)/dx)

x = [(start+i*dx) for i in range(0,n+1)]
pie = math.pi

yo=[1]
y = [1 for i in range(1,n)]
yo.extend(y)
yo.append(1)
plt.plot(x,yo, label="T = 0.0")
print(yo)
ax.plot(x,yo,0, label="T = 0.0")
for j in range(0,10):

	a = [0 if (i==0 or i==n) else r/2 for i in range(0,n+1)]
	b = [0 if (i==0 or i==n) else -r-1 for i in range(0,n+1)]
	c = [0 if (i==0 or i==n) else r/2 for i in range(0,n+1)]
	d = [0 if (i==0 or i==n) else (-r*yo[i-1]/2.0 + (r-1)*yo[i] - r*yo[i+1]/2.0) for i in range(0,n+1)]

	a[0]=0
	b[0]=-(r*dx+r+1)
	c[0]=r
	d[0]=(r*dx+r-1)*yo[0] - r*yo[1]
	a[n]=r
	b[n]=-(r*dx+r+1)
	c[n]=0
	d[n]=-r*yo[n-1] + (r*dx+r-1)*yo[n]
	c1 = [0 for i in range(0,n+1)]
	d1 = [0 for i in range(0,n+1)]

	c1[0] = c[0]/b[0]
	d1[0] = d[0]/b[0]

	for i in range(1,n+1):
		c1[i] = c[i]/(b[i] - a[i]*c1[i-1])
		d1[i] = (d[i]-a[i]*d1[i-1])/(b[i]-a[i]*c1[i-1])

	yo[n]=d1[n]
	for i in range(n-1,-1,-1):
		yo[i]=d1[i]-c1[i]*yo[i+1]
	print(yo)
	ax.plot(x,yo,float((j+1))/27)
	#plt.plot(x,yo, label = ("T = "+str((j+1)/25.0)))
plt.legend()
ax.set_xlabel('X values', fontsize=10)
ax.set_ylabel('U values', fontsize=10)
ax.set_zlabel('Time', fontsize=10)
plt.suptitle('Crank Nicolson Method\ndx=0.2, dt=0.04')
plt.show()
