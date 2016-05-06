from __future__ import division
import sys
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import matplotlib
import numpy as np
from matplotlib import cm
from matplotlib import pyplot as plt


fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
dx=0.25
dy=0.25
start1 = 0
end1 = 1.0
n1=(end1 - start1)/dx
n1=int(n1)
start2 = 0
end2 = 1.0
n2=(end2 - start2)/dy
n2=int(n2)

A=[[0.0 for i in range(0,5)] for j in range(0,5)]
B=[[0.0 for i in range(0,5)] for j in range(0,5)]
A=np.array(A)
B=np.array(B)
m=1
K=0
print("K=0\n")
print(B)
while(m>0.00005):
	D = [[-64, 16, 0], [16, -64, 16], [0, 16, -64]]
	for i in range(1,4):
		C = [(np.square(i*dx) + 1.0/16.0 - 16*B[i-1][1] - 16*A[i+1][1]), (np.square(i*dx) + 1.0/4.0 - 16*B[i-1][2] - 16*A[i+1][2]), (np.square(i*dx) + 9.0/16.0 - 16*B[i-1][3] - 16*A[i+1][3])]
		C = np.array(C)
		X = np.dot(np.linalg.inv(D),C)
		for j in range(1,4):
			B[i][j] = X[j-1]

	m=0.0
	for i in range(1,4):
		for j in range(1,4):
			m += np.square(B[i][j] - A[i][j])
	print(A)
	A=B
	K+=1
	print(m)
	print("K= "+str(K))
	print(B)

x = [ i*0.25 for i in range(0,5)]
y = [ i*0.25 for i in range(0,5)]
x,y =np.meshgrid(x,y)
ax.plot_surface(x,y,B,rstride=1, cstride=1)
plt.suptitle('Line by Line Algorithm\n dx=0.25, dy=0.25')
ax.set_xlabel('X values', fontsize=10)
ax.set_ylabel('Y values', fontsize=10)
ax.set_zlabel('Z Values', fontsize=10)
plt.show()