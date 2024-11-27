#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 6;
x0 = 0.5*pi;
sum = 0;

for i=1:1:n
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

for i=1:1:n
  pr = 1;
  for j = 1:1:(i-1)
    pr = pr*(x0-x(j))/(x(i)-x(j));
  endfor
  for j = (i+1):1:n
    pr = pr*(x0- x(j))/(x(i)-x(j));
  endfor
  sum = sum + pr*y(i);
endfor

sum