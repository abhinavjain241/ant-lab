function [X,F] = solve()

%set the initial value for alpha1 and alpha2
alpha(1) = 0.5;
alpha(2) = 1.0;

%alpha(1) = 0.3;
%alpha(2) = 0.4;

[T,Y] = call_func(alpha(1));
[T,Z] = call_func(alpha(2));

%set actual value of y at final time
finalVal = 2;
%finalVal = -1;

%phi the the difference of output and actual
phi(1) = Y(end,1)-finalVal;
phi(2) = Z(end,1)-finalVal;

%setting difference of given alpha's
dif = alpha(2)-alpha(1);

i = 2;
while ~(abs(dif) <= 0.5*(10^-5))
    %f is just the factor
    f = (alpha(i)-alpha(i-1))/(phi(i)-phi(i-1));
    
    %getting the next value of phi
    alpha(i+1) = alpha(i)- f*phi(i);
    
    %solving for alpha(i+1)
    [T,W] = call_func(alpha(i+1));
    
    %setting new next phi
    phi(i+1) = W(end,1)-finalVal;
    
    %setting the difference of alpha's
    dif = alpha(i+1)-alpha(i);
    
    %increamenting i
    i = i+1;
    
end
x = alpha(i);
str = ['final value of alpha is ' num2str(x)];
disp(str)
disp('solving for above alpha')
[X,F] = call_func(alpha(i));
plot(T,F(:,1));
xlabel('time');
ylabel('output');

end
