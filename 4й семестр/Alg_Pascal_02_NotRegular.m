clear all;
n = 5;
x = [1 3 5 7 9]';
y = [11 15 7 12 14]';
dx = 2;
X0 = 2;
dy(1:1:n, 1:1:n) = 0;
dy(:,1) = y;
for j=2:1:n
  for i=1:1:(n-j+1)
    dy(i,j) = (dy(i+1,j-1) - dy(i,j-1)) / (x(i + j - 1) - x(i));
  endfor
endfor

sum = 0;
for i=1:1:n
  pr = 1;
  for j=1:1:i-1
    pr = pr * (X0 - x(j));
  endfor
  sum = sum + (dy(1,i) * pr);
endfor

sum

