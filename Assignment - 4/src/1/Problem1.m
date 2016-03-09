h = .02;
matrixA = zeros(n-1, n-1);
vec_b = zeros(1, n-1);
y = zeros(1, n+1);

a = @(x,ym1,y,yp1)(1);
b = @(x,ym1,y,yp1)(-2-1.5*h*h*(1+x+y)^2);
c = @(x,ym1,y,yp1)(1);
d = @(x,ym1,y,yp1)(h/2*h*(1+x+y)^3-yp1+2*y-ym1);
x = 0:h:1;
n = length(x)-1;
f = @(x)(x*(1-x));

for i=1:n+1,
    y(i) = f(x(i));
end

legend_vals = {'k = 0'};
plot(x,y,'-.', 'LineWidth',1);
hold on;

dy = 1;
k = 0;
while max(abs(dy))>1e-5,
    k = k+1;
    for i=2:n,
        ind = i-1;
        matrixA(ind,ind) = b(x(i), y(i-1), y(i), y(i+1));
        matrixA(ind+1,ind) = a(x(i), y(i-1), y(i), y(i+1));
        matrixA(ind,ind+1) = c(x(i), y(i-1), y(i), y(i+1));
        vec_b(ind) = d(x(i), y(i-1), y(i), y(i+1));
    end

    matrixA = matrixA(1:n-1,1:n-1);

%     dy = vec_b/matrixA;
    dy = thomas(matrixA,vec_b');
    dy = [0 dy' 0];
    y = y + dy;

    
    p = plot(x,y,'-.', 'LineWidth',1);
    
    legend_vals = [legend_vals (strcat('k = ',num2str(k)))];

end

set(p, 'LineWidth',1.5, 'LineStyle', '-')
xlabel('X Axis');
ylabel('Y Axis');

legend(legend_vals)
figure
plot(x,y)
legend('y = f(x)')
