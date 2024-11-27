clear all
n = 4;
clc

A = [16 -8 -4 0;
    -8 13 -4 -3;
    -4 -4 9 0;
    0 -3 0 3]

A^-1

AB=cat(2,A,eye(n))

AB0 = AB

% for a:b:c, a-условие начала, b-шаг, c-условие конца

for j=1:1:(n-1)
  for i = (j+1):1:n
    for k=1:1:(2)
      AB0(i,k)=AB(i,k)-AB(j,k)*AB(i,j)/AB(j,j);
    endfor
    AB=AB0;
  endfor
endfor

AB

for j=n:(-1):2
  for i=(j-1):(-1):1
    for k=1:1:(2)
      AB0(i,k)=AB(i,k)-AB(j,k)*AB(i,j)/AB(j,j);
    endfor
    AB=AB0;
  endfor
endfor

AB

pr=1;
for j=1:1:n
  pr=AB(j,j)*pr;
endfor
pr
% AB(:,(n+1):1:2*n)







