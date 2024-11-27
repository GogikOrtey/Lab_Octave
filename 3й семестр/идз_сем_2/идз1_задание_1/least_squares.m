#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 6;

for i=1:1:n
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

A = [sum(x.*x) sum(x); sum(x) n];
B = [sum(y.*x) sum(y)]';
X = A^(-1) * B;

k = X(1);
b = X(2);
x2 = (0:0.001:1.2*pi);
y2 = k * x2 + b;

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',10,x2,y2,'-','LineWidth',2);