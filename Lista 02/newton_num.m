function x = newton_num(func,dx,x0,tol)
% NEWTON: resolução de equação não linear
%
%   newton(func,der,x0,tol): aplicação do método Newton-Raphson na
%   resolução de uma equação não linear. O método consiste na
%   seguinte iteração:
%     
%      x(n+1) = x(n) - f(x(n))/f'(x(n))
%
%   Variáveis de entrada
%      func: nome da função
%      dx: passo para a derivada numerica
%      x0: chute inicial
%      tol: tolerancia
%
fx0 = feval(func,x0);
cont = 0;
while abs(fx0)>tol
    der = (feval(func,(x0+dx))-feval(func,x0))/dx;
    x = x0 - feval(func,x0)/der;
    x0 = x;
    fx0 = feval(func,x0);
    cont = cont+1;
end
cont