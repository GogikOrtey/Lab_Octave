# 2) Метод Лагранжа

clc
clear

n = 4
x = [1 3 5 7]';
y = [4 3 9 4]';

X= eye(n);

sum=0;

x0=2;

for i=1:1:n
  pr=1;
  for j=1:1:(i-1);
    pr=pr*(x0-x(j))/(x(i)-x(j));
  endfor;
  for j=i+1:1:n
    pr=pr*(x0-x(j))/(x(i)-x(j));
  endfor;
  sum=sum+pr*y(i);
end;
sum
