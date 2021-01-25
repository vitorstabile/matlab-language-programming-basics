function x = bisec(func,a,b,tol)
% BISEC: resolução de equação não linear
%
%   bisec(func,a,b,tol): aplicação do método da bissecção na
%   resolução de uma equação não linear. No método pressupõe-se
%   que a raiz da função "func" esteja no intervalo [a,b].
%
%   Variáveis de entrada
%      func: nome da função
%      a: limite inferior de busca
%      b: limite superior de busca
%      tol: tolerancia
%
c = (a+b)/2;
fa = feval(func,a);
fc = feval(func,c);
cont = 0;
while abs(a-b)>tol
    if (fa*fc)<0
        b = c;
    else
        a = c;
    end
    c = (a+b)/2;
    fa = feval(func,a);
    fc = feval(func,c);
    cont = cont+1;
end
cont
x = a;

