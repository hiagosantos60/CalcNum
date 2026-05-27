% Método de Jacobi-Richardson 

a=[10 2 1; 1 5 1; 2 3 10]; % 3x3
b=[7; -8; 6]; % 3x1

%%DIVISÃO DAS MATRIZES PELO ELEMENTO DA DIAGONAL PRINCIPAL 
[m n]=size(a);
for i=1:m
    divisor = a(i,i);
    b(i,:) = b(i,:)/divisor;
    a(i,:) = a(i,:)/divisor;
    a(i,i) = 0;
end

%chute inicial 
x0 = [0;0;0]; % antigo 3x1
x1 = b-a*x0; % novo 3x1
erro = max(abs(x1-x0));

while(erro > 0.01) 
    x1 = b-a*x0;
    % Forma verbosa de fazer a atualização  
    % for i=1:size(a)
    %     x1(i) = b(i) - a(i,:)*x0;
    % end
    erro = max(abs(x1-x0));
    x0 = x1; % atualiza o proximo chute inicial
end

x1
x0