function x = bisec(func,a,b,tol)
% BISEC: resolu��o de equa��o n�o linear
%
%   bisec(func,a,b,tol): aplica��o do m�todo da bissec��o na
%   resolu��o de uma equa��o n�o linear. No m�todo pressup�e-se
%   que a raiz da fun��o "func" esteja no intervalo [a,b].
%
%   Vari�veis de entrada
%      func: nome da fun��o
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

