# Aplicação do professor:

erro = 1;
x1 = -2;
f = @(x) 4*cos(x)-exp(x)
df=@(x) -4*sin(x)-exp(x)

while (erro > 0.01)

  x2 = (2 * x1 + 4/(x1*x1))/3

  erro = abs (x2-x1);
  x1 = x2;
end