function[X,Y] = tdma(x_init, x_fin, h)

n = (x_fin-x_init) / h;
Xtemp = (x_init + h: h :x_fin - h);

for i = 1:n-1
    A(:,:,i) = [1/h^2 0;0 1/h^2];
    B(:,:,i) = [-2/h^2 -1;81 -2/h^2];
    C(:,:,i) = [1/h^2 0;0 1/h^2];
    D(:,:,i) = [0;81*Xtemp(i)^2];
end

C1(:,:,1) = inv(B(:,:,1))*C(:,:,1);
D1(:,:,1) = inv(B(:,:,1))*D(:,:,1);

for i = 2:n-1
    B1(:,:,i) = B(:,:,i)- (A(:,:,i)*C1(:,:,i-1));
    C1(:,:,i) = inv(B1(:,:,i))*C(:,:,i);
    D1(:,:,i) = inv(B1(:,:,i))*(D(:,:,i)-A(:,:,i)*D1(:,:,i-1));
end

W(:,:,n-1) = D1(:,:,n-1);
for i = n-2:-1:1
    W(:,:,i) = D1(:,:,i)-(C1(:,:,i)*W(:,:,i+1));
end

for i=1:n-1
    Y(i+1) = W(1,1,i)
    X(i+1) = Xtemp(i);
end
Y(1) = 0; Y(n + 1) = 0;
X(1) = x_init;
X(n + 1) = x_fin;

plot(X, Y, X, Y, '*', X, Y,'r');
display(X, 'X');
display(Y, 'Y');
plot(X, Y, X, Y, '*', X, Y, 'r');
xlabel('X(Domain)');
ylabel('Y(Solution)');
title('Plot - 4');
end







