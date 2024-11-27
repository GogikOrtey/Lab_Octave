#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 6;

for i=1:1:n
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

for i=1:1:n
  for j = 1:1:n
    A(i,j) = x(i)^(j-1);
  endfor
endfor

k = A^(-1)*y;

x0 = 0.5 * pi;
sum = 0;
for i=1:1:n
  sum = sum + k(i)*x0^(i-1);
endfor

sum