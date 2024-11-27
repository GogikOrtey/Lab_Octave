clear all;

x=[1 3 5 7 9];
y=[8 7 7 8 10];
n=4;

for i=1:1:n
  B(i)=y(i+1)-y(i);
endfor
B((n+1):1:2*n)=0;

for i=1:1:n
  A(i, 2*i-1)=(x(i+1)-x(i))^2;
  A(i, 2*i)=x(i+1)-x(i);
endfor

for i=1:1:(n-1)
  A(n+i, 2*i-1)=2*(x(i+1)-x(i));
  A(n+i, 2*i)=1;
  A(n+i, 2*i+2)=-1;
endfor
#A(2*n, 2)=1;
A(2*n,2*n-1)=2*(x(n+1)-x(n));
A(2*n,2*n)=1;

X=A^(-1)*B';
c=y;
for i=1:1:n
  a(i)=X(2*i-1);
  b(i)=X(2*i);
endfor

k=0;
for i=1:1:n
  for j=x(i):0.001:x(i+1)
    k=k+1;
    x4(k)=j;
    y4(k)=a(i)*(x4(k)-x(i))^2 + b(i)*(x4(k)-x(i))+c(i);
  endfor
endfor
plot(x,y,'.',x4,y4,'-')
