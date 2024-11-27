clear all
n = 2;
x = [1:1:10]';
y = [18 20 15 15 15 21 18 20 16 12]';

for i = 0:1:n
  for j = 0:1:n
    A(i+1, j+1) = sum(x.^(2 * n - i - j));
  end
  B(i+1) = sum(y.*x.^(n-i));
end

elem = A^(-1)*B';
a = elem(1);
b = elem(2);
c = elem(3);
x4 = [1:0.01:10]';
y4 = a* x4.^2 + b * x4 + c;

plot(x, y, '.', x4, y4)
