clear all
n=4;
A=[-6 -5 -3 -8; 5 -1 -5 -4; -6 0 5 5; -7 -2 8 5];
B=[101 51 -53 -63]';

detA = det(A) #определитель
invA = A^(-1) #обратная

x=A^(-1)*B
ab=cat(2,A,B)
ab0=ab

for j=1:1:(n-1)
  for i=(j+1):1:n
    for k=1:1:(n+1)
      ab0(i,k)=ab(i,k)-ab(j,k)/ab(j,j)*ab(i,j);
    endfor
    ab=ab0
  endfor
endfor

for j=n:-1:2
  for i=(j-1):-1:1
    for k=1:1:(n+1)
      ab0(i,k)=ab(i,k) - ab(j,k)/ab(j,j)*ab(i,j);
    endfor
    ab=ab0
  endfor
endfor

ab
detA_gauss = ab(1,1)*ab(2,2)*ab(3,3)*ab(4,4) #определитель

for j=1:1:n
  for k=1:1:(n+1)
    ab0(j,k)=ab(j,k)/ab(j,j)
  endfor
endfor
ab=ab0
