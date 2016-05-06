import numpy as np
import math
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = fig.gca(projection='3d')

dx=1.0/3
r=1.0/3
start=-1.0
end=1.0
n=int((end-start)/dx)

x = [(start+i*dx) for i in range(0,n+1)]
pie = math.pi

y_val=[0]
y = [math.cos((pie*x[i])/2.0) for i in range(1,n)]
y_val.extend(y)
y_val.append(0)
print(y_val)
plt.plot(x,y_val)
#ax.plot(x,y_val,0, label="T = 0.0")
for j in range(0,9):
	a = [0 if (i==0 or i==n) else r/2 for i in range(0,n+1)]
	b = [0 if (i==0 or i==n) else -r-1 for i in range(0,n+1)]
	c = [0 if (i==0 or i==n) else r/2 for i in range(0,n+1)]
	d = [0 if (i==0 or i==n) else (-r*y_val[i-1]/2.0 + (r-1)*y_val[i] - r*y_val[i+1]/2.0) for i in range(0,n+1)]

	c1 = [0 for i in range(0,n+1)]
	d1 = [0 for i in range(0,n+1)]

	c1[1] = c[1]/b[1]
	d1[1] = d[1]/b[1]

	for i in range(2,n):
		c1[i] = c[i]/(b[i] - a[i]*c1[i-1])
		d1[i] = (d[i]-a[i]*d1[i-1])/(b[i]-a[i]*c1[i-1])

	y_val[n-1]=d1[n-1]
	for i in range(n-2,0,-1):
		y_val[i]=d1[i]-c1[i]*y_val[i+1]
	print(y_val)
	ax.plot(x,y_val,float((j+1))/27)

plt.suptitle('Crank Nicolson Method\ndx=1/3, dt=1/27')
ax.set_xlabel('X values', fontsize=10)
ax.set_ylabel('U values', fontsize=10)
ax.set_zlabel('Time', fontsize=10)

plt.show()