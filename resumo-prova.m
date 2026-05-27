% metodo da bissecao
f=@(x) x^2+2*x-2;
a=0.4;
b=2;
erro = 1;
tolerancia = 0.0001; 
while (erro > tolerancia)
    x=(a+b)/2;
    if(f(a)<0 && f(b)>0 && f(x)<0)
        a=x;
    end
    if(f(a)<0 && f(b)>0 && f(x)>0)
        b=x;
    end
    erro = abs(b-a);
end

% metodo do ponto fixo
phi = @(x) exp(x)/4; %validar se a phi é valida
chute = 0.5;
tolerancia = 0.0001;
erro = 1;
while erro > tolerancia
    prox = phi(chute);        
    erro = abs(prox - chute);
    chute = prox;
end
chute

% metodo de newton para linear
f = @(x) x^2 + 2*x - 2;
df = @(x) 2*x + 2;
% chute entre [0,1], também podemos testar com outro intervalo
x1 = 0.5; 
tolerancia = 0.0001;
erro = 1;
while (erro > tolerancia)
    x2 = x1 - f(x1)/df(x1);
    erro = abs(x2 - x1);
    x1 = x2; 
end

% metodo da secante
f = @(x) x^2 + 2*x - 2;
x0 = 0; 
x1 = 1;   
tolerancia = 0.0001;
erro = 1;
while (erro > tolerancia)
    x_novo = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    erro = abs(x_novo - x1);
    x0 = x1;     
    x1 = x_novo; 
end

% metodo de jacobi-richardson
a=[]; % colocar as matrizes
b=[]; 
 %%DIVISÃO DAS MATRIZES PELO ELEMENTO DA DIAGONAL PRINCIPAL 
[m n]=size(a);
for i=1:m
    divisor = a(i,i);
    b(i,:) = b(i,:)/divisor;
    a(i,:) = a(i,:)/divisor;
    a(i,i) = 0;
end 
x0 = []; % colocar de acordo com o necessário 
erro = 1;
while(erro > 0.01) 
    x1 = b-a*x0;
    erro = max(abs(x1-x0));
    x0 = x1; 
end

% metodo de newton para vetorial
F = @(x) [x(1)^2 + x(1)*x(2)^2 - 2; x(1)*x(2) - 3*x(1)*x(2)^3 + 4];
J = @(x) [2*x(1) + x(2)^2, 2*x(1)*x(2);  x(2) - 3*x(2)^3,     x(1) - 9*x(1)*x(2)^2];
X = [1; 0];     
erro = 1;      
tol = 0.02;      
max_iter = 50;   
iter = 0;
while (erro > tol && iter < max_iter)
    X0 = X;
    delta = J(X0) \ (-F(X0)); 
    X = X0 + delta;
    erro = norm(X - X0);
    iter = iter + 1;
end