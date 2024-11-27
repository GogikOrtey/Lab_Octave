clc
clear

# Квадратурная формула Ньютона-Котеса для интеграла первого порядка
function result = newton_cotes(f, a, b, n) h = (b - a) / n;
  nodes = a:h:b;
  weights = ones(1, length(nodes));
  weights(1) = weights(end) = 0.5;
  result = h * sum(weights .* f(nodes));
endfunction

# Составная квадратурная формула Ньютона-Котеса для интеграла первого порядка
function result = composite_newton_cotes(f, a, b, n, m) h = (b - a) / n;
  nodes = a:h:b; result = 0;
  for i = 1:n result = result + newton_cotes(f, nodes(i), nodes(i+1), m);
  endfor
endfunction

# Вычисление интеграла при помощи квадратурной формулы Ньютона-Котеса
f = @(x) 1./x;
a = 1;
b = 2;
n = 10;

result = newton_cotes(f, a, b, n)

result = composite_newton_cotes(f, a, b, n, n)
