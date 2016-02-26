function xp = F(t, x)
%Equivalent 
%   Detailed explanation goes here
xp = zeros(2,1);
xp(1) = x(2);
xp(2) = (-(x(2) * x(2)) - 1)/x(1);

end

