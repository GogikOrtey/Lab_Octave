#13. y(x) = cos(x) + x

clear all;
x = [0 0.2*pi 0.4*pi 0.6*pi 0.8*pi pi]';
y = [0 0 0 0 0 0]';
n = 6;
N = 3; # степень функции

for i=1:1:n
  X = i * 0.2 * pi;
  y(i) = cos(X)+x(i);
endfor

for i=1:1:(N+1)
  B(i) = sum(y.*(x.^(N - i + 1)));
endfor  

for i=1:1:(N+1)
  for j=1:1:(N+1)
    A(i,j) = sum(x.^(2*N - i - j + 2));
  endfor
endfor

X = A^(-1) * B';
x2 = (0:0.1:1.2*pi)';
y2(1:1:length(x2)) = 0;

for i=1:1:(N+1)
  y2 = y2 + X(i) * x2.^(N - i + 1);
endfor

plot(x, y,'s','MarkerEdgeColor','k','MarkerSize',10,x2,y2,'-','LineWidth',2); 