h = 0.25;
dx = h;
dy = h;

x = 0:dx:1; % Row vector of 5 elements
y = 0:dy:1; % Row vector of 5 elements

m = length(x)-1;
n = length(y)-1;

u(:,:,:) = zeros(m+1, n+1); % Make an (m + 1) x (n + 1) matrix filled with zeroes
z = 1;
first = true;
while first || max(max(abs(u(:,:,end)-u(:,:,end-1))))>1e-5,
    first  = false;
    z = z+1;
    u(:,:,z) = zeros(m+1, n+1);
    for i = 2:m,
        for j = 2:n,
            u(i,j,z) = 1/4*(u(i+1,j,z-1)+u(i-1,j,z)+u(i,j+1,z-1)+u(i,j-1,z) - h*h*x(i)*x(i) - h*h*y(j)*y(j));
        end
    end
end