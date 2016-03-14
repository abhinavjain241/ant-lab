%implict scheme to solve parabolic pde
function [y] = implicitSolvePDE()
% Implicit Method
clear;
% Parameters to define the heat equation and the range in space and time
L = 1; % Lenth of the wire
T = 0.04; % Final time
% Parameters needed to solve the equation within the fully implicit method
k_max = 4; % Number of time steps
dt = T / k_max;
n = 4; % Number of space steps
dx = L/n;
cond = 1; % Conductivity
b = cond * dt/ (dx * dx); % Parameter of the method
% Initial temperature of the wire: a sinus.
for i = 1:n+1
x(i) = (i - 1) * dx;
u(i,1) = sin(pi * x(i));
end
% Temperature at the boundary (T=0)
for k = 1:k_max+1
u(1,k) = 0.;
u(n+1,k) = 0.;
time(k) = (k-1)*dt;
end
aa(1:n-2) = -b;
bb(1:n-1) = 1.+2.*b;
cc(1:n-2) = -b;
MM = inv(diag(bb,0) + diag(aa,-1) + diag(cc,1));
% Implementation of the implicit method
for k=2:k_max % Time Loop
uu = u(2:n,k-1);
u(2:n,k) = MM*uu;
end
%storing solution in y
y = u(:,1:4);
y = y';
% Graphical representation of the temperature at different selected times
figure(1)
plot(x,u(:,1),'-',x,u(:,2),'-',x,u(:,3),'-',x,u(:,4),'-')
title('Temperature within the lasson (implicit) method')
xlabel('X')
ylabel('T')
figure(2)
mesh(x,time,u')
title('Temperature within the implicit method')
xlabel('X')
ylabel('Temperature')

end
