clear all;
n = 4;
a = [24 -7 -4 4; -3 -9 -2 -2; 3 7 24 9; 1 -6 -2 -15];
b = [-190 -12 155 -17]';

a^(-1)*b # точное решение
x0 = [0 0 0 0]';

for k=1:1:100
  for i=1:1:n
    sum = 0;
    for j=1:1:(i-1)
      sum = sum + a(i,j)*x(j);
    endfor
    for j=(i+1):1:n
      sum = sum + a(i,j)*x0(j);
    endfor
    x(i) = -sum/a(i,i) + b(i)/a(i,i);
  endfor
  x0=x;
  [k max(abs(a*x'-b))]
endfor

