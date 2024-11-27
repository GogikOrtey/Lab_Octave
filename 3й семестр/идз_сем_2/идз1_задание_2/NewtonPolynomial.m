#13. y(x) = cos(x) + x

clear all;
format long;

x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi]';
y = cos(x)+x;
dx = 0.2*pi;
n = 5;
dy(1:1:n, 1:1:n) = 0;
dy(:,1) = y;

for j = 2:1:n
  for i = 1:1:(n-j+1)
    dy(i,j)=(dy(i+1,j-1)-dy(i,j-1));
  endfor
endfor

dr = -sin(0.4*pi) + 1;
q = 2;
d = 1/dx * (dy(1,n) + dy(1,n)^2/2 * (2*q - 1) + dy(1,n)^3/6*(3*q^2 - 6*q + 2) + dy(1,n)^4/24 *
(4*q^3 - 18*q^2 + 22*q - 6));

d
dr



