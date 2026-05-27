F = @(x) [x(1)^2 + x(2)^2 - 1; 
          x(1) - x(2)^2]; 

J = @(x) [2*x(1),  2*x(2); 
          1,      -2*x(2)];
erro=1;
tol=0.02;

x=[1;1];

while erro>tol
    x0 = x;
    delta = -J(x0)\F(x0);
    x = x0 + delta;
    erro=abs(norm(x-x0));
end
x