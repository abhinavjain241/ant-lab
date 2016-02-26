function [T,Y] = call_func(alpha)

%partiton of time interval of given problem
tspace = linspace(0,1,6);
%tspace = linspace(0,1,11);

%initial value of y1
y1_0 = 1;
%y1_0 = 0;

%initial value of y2
y2_0 = alpha;

inival = [y1_0 y2_0];

%change the function according to your need
[T,Y] = ode45(@F,tspace,inival);

%plot(T,Y(:,1))
%hold on
%plot(Y(:,1),Y(:,2))
%xlabel('time');
%ylabel('output');
end
