#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 6;
x0 = 0.5*pi;
dx = 0.2 * pi;

for i=1:1:n
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

dy(:,1) = y;
for j =2:1:n
  for i = 1: 1: (n - j + 1)
    dy(i,j) = (dy(i+1,j-1) - dy(i, j - 1)) / (x(i + j - 1) - x(i));
  endfor
endfor

sum = 0;
for i=1:1:n
  pr = 1;
  for j = 1: 1: (i - 1)
    pr = pr* (x0 - x(j));
  endfor
  sum += dy(1,i)*pr;
endfor

sum