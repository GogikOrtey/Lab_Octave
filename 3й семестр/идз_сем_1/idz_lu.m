clear all
n=4;
a=[-6 -5 -3 -8; 5 -1 -5 -4; -6 0 5 5; -7 -2 8 5];
detA = det(a)
l=eye(n);
u(1:1:n,1:1:n)=0;

for i=1:1:n
  
  for j=1:1:(i-1) # l
    sum = 0;
    for k = 1:1:(j-1)
      sum = sum + l(i,k)*u(k,j);
    endfor
    l(i,j) = (a(i,j) - sum)/u(j,j);
  endfor
  
  for j=i:1:n # u
    sum = 0;
    for k = 1:1:(j-1);
      sum = sum + l(i,k)*u(k,j);
    endfor
    u(i,j) = a(i,j) - sum;
  endfor
  
endfor

l
u
b=[101 51 -53 -63]'

for i=1:1:n
  sum = 0;
  for k=1:1:(i-1)
    sum = sum + l(i,k)*y(k);
  endfor
  y(i)=b(i) - sum;
endfor

for i=n:(-1):1
  sum = 0;
  for k=(i+1):1:n
    sum = sum + u(i,k)*x(k);
  endfor
  x(i)=(y(i)-sum)/u(i,i);
endfor