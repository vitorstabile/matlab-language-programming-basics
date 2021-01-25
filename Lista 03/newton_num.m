function x = newton_num(func,dx,x0,tol)
% NEWTON: resolu��o de equa��o n�o linear
%
%   newton(func,der,x0,tol): aplica��o do m�todo Newton-Raphson na
%   resolu��o de uma equa��o n�o linear. O m�todo consiste na
%   seguinte itera��o:
%     
%      x(n+1) = x(n) - f(x(n))/f'(x(n))
%
%   Vari�veis de entrada
%      func: nome da fun��o
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