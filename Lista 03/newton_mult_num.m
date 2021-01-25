function x = newton_mult_num(func,dx,ro,x0,tol)
% NEWTON_MULT: resolução de sistema de equações não lineares
%
%   newton(func,dx,ro,x0,tol): aplicação do método Newton-Raphson na
%   resolução de um sistema de equações não lineares, por meio da
%   estimativa numerica da matriz jacobiana. O método consiste na
%   seguinte iteração:
%     
%      J*delta = -f
%
%      x(n+1) = x(n) + ro*delta
%
%   Variáveis de entrada
%      func: nome da função multivariável
%      dx: acrescimo na funcao
%      ro: parâmetro de relaxamento
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

