clear all;
n=10;
x=[1:1:10]';
y=[16 16 15 16 15 19 18 17 17 18]';
s=3;

for i=0:1:s
  for j=0:1:s
    A(i+1,j+1)=sum(x.^(2*s-i-j));
  endfor
  B(i+1)=sum(y.*x.^(s-i));
endfor

temp=A^(-1)*B';
x4=[1:0.01:10]';
y4=0;

for i=0:1:s
  y4=y4+temp(i+1)*x4.^(s-i);
endfor

plot(x, y, '.', x4, y4, '-')
