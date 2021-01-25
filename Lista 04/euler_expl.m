function [t,y] = euler_expl(func,tspan,y0,h)
%
% EULER_EXPL: resolu��o de um sistema de EDOs
%             utilizando o m�todo expl�cito de Euler
%
%   euler_expl(func,tspan,y0,h): aplica��o do m�todo expl�cito
%   de Euler na resolu��o de um sistema de equa��es diferenciais
%   ordin�rias em problemas de valor inicial
%
%                 y(j+1) = y(j) + h*f(t(j),y(j))
%
%   Vari�veis de entrada
%      func: nome da fun��o
%      tspan = [t0 tf]
%      y0: valores iniciais do vetor y
%      h: passo de integra��o
%
%   Vari�veis de sa�da
%      t: tempo
%      y: vari�vel dependente do tempo
%
n = length(y0);
to = tspan(1);
tf = tspan(2);
t = (to:h:tf)';
y = zeros(n,length(t));
y(:,1) = y0;
for j = 2:length(t)
    y(:,j) = y(:,j-1)+h*(feval(func,t(j-1),y(:,j-1)));
end
y = y';