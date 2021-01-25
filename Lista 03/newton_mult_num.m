function x = newton_mult_num(func,dx,ro,x0,tol)
% NEWTON_MULT: resolu��o de sistema de equa��es n�o lineares
%
%   newton(func,dx,ro,x0,tol): aplica��o do m�todo Newton-Raphson na
%   resolu��o de um sistema de equa��es n�o lineares, por meio da
%   estimativa numerica da matriz jacobiana. O m�todo consiste na
%   seguinte itera��o:
%     
%      J*delta = -f
%
%      x(n+1) = x(n) + ro*delta
%
%   Vari�veis de entrada
%      func: nome da fun��o multivari�vel
%      dx: acrescimo na funcao
%      ro: par�metro de relaxamento
%      x0: chute inicial
%      tol: tolerancia
%
fx0 = feval(func,x0);
n = length(fx0);
J = zeros(n,n);
while fx0'*fx0>tol
    for i = 1:n
        for k = 1:n
            aux = x0;
            aux(k) = x0(k) + dx;
            der = (feval(func,aux)-fx0)/dx;
            J(i,k) = der(i);
        end
    end
    delta = -J\fx0;
    x = x0 + ro*delta;
    x0 = x;
    fx0 = feval(func,x0);
end

