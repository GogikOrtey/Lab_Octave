clear all;

# 14 9 0 0 0
# -8 14 6 0 0
# 0 -5 -17 8 0
# 0 0 1 5 -2
# 0 0 0 -4 -10

n = 5;
a = [0 -8 -5 2 -4]';
b = [14 14 -17 -2 -10]';
c = [9 6 8 -2 0]';
d = [125 -56 144 36 70]';
delta(1:1:n) = 0;
lamda(1:1:n) = 0;

delta(1) = -c(1)/b(1);
lamda(1) = d(1)/b(1);

for i = 2:1:n
  delta(i) = -c(i)/(a(i)*delta(i-1)+b(i));
  lamda(i) = (d(i)-a(i)*lamda(i-1))/(a(i)*delta(i-1)+b(i));
endfor

x(n) = lamda(n);

for i = (n-1):(-1):1
  x(i) = delta(i)*x(i+1) + lamda(i);
endfor

A(1:1:n, 1:1:n) = 0;

for i = 1:1:(n-1)
  A(i+1,i)=a(i+1);
  A(i,i) = b(i);
  A(i,i+1) = c(i);
endfor

A(n,n) = b(n);

A^(-1) * d
x

