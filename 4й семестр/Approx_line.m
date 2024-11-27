clear all
n = 10
x = [1:1:10]';
y = [18 20 15 15 15 21 18 20 16 12]';
A = [sum(x.^2) sum(x); sum(x) n];
B = [sum(x.*y) sum(y)]';

elem = A^(-1)*B;
a = elem(1);
b = elem(2);

x4 = [1:0.09:10]';
y4 = a*x4 + b;


plot(x, y, '.', x4, y4)
