clear all;
n=10;
x=[1:1:10]';
y=[16 16 15 16 15 19 18 17 17 18]';

A=[sum(x.^2) sum(x); sum(x) n];
B=[sum(y.*x), sum(y)]';

temp=A^(-1)*B;
a=temp(1);
b=temp(2);

x4=[1:0.001:10]';
y4=a*x4+b;
plot(x, y, '.', x4, y4, '-')
