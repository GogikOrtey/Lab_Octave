#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 5;

for i = 1:1:n+1
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

A=zeros(2*n, 2*n);
B(1:1:2*n) = 0;

for i=1:1:n
  B(i) = y(i+1) - y(i);
endfor

A(1:1:2*n, 1:1:2*n) = 0;
for i = 1:1:n
  A(i, 2*i-1) = x(i+1) - x(i);
  A(i, 2*i) = (x(i+1) - x(i))^2;
endfor

for i=1:1:(n-1)
  A(i+n, 2*i-1) = 1;
  A(i+n, 2*i) = 2*(x(i+1) - x(i));
  A(i+n, 2*i+1) = -1;
endfor

# A(2*n, 2*n-1) = 1; # вариант 1
# A(2*n, 2*n) = 2*(x(n+1) - x(n)); # вариант 1
A(2*n,1) = 1; # вариант 2

X = A^(-1)*B';

for i=1:1:n
  a(i) = y(i);
  b(i) = X(2*i-1);
  c(i) = X(2*i);
endfor

k = 0;
for i=1:1:n
  for x0 = x(i):0.1:x(i+1)
    k = k+1;
    x2(k) = x0;
    y2(k) = a(i) + b(i) * (x0 - x(i)) + c(i)*(x0 - x(i))^2;
  endfor
endfor

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',10, x2,y2,'-','LineWidth',2)
