# 4) Метод Ньютона 2 для не регулярной сетки

clc
clear

n = 4
x = [1 3 5 7]';
y = [4 3 9 4]';

X= eye(n);

dy=zeros(n);

dy(:,1)=y;

# Изменения пометил комментариями

for j=2:1:n
  for i=1:1:(n-j+1)
    #dy(i,j) = dy(i+1,j-1)-dy(i,j-1);
    dy(i,j) = (dy(i+1,j-1)-dy(i,j-1))/(x(i+j-1)-x(i));
  endfor
endfor

dy

x0=2;
sum=0;
#dx=2;

for i=1:1:n
  pr=1;
  for j=1:1:(i-1)
    pr=pr*(x0-x(j));
  endfor
  sum=sum+dy(1,i)*pr; #/(factorial(i-1)*dx^(i-1));
endfor

sum




























