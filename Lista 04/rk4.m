function [t,y]  = rk4(func,tspan,y0,h)
%
%   RK4: resolução de um sistema de EDOs
%        utilizando o método clássico de Runge-Kutta
%
%   rk4(func,tspan,y0,h): aplicação do método de Runge-Kutta
%   de quarta ordem na resolução de um sistema de equações
%   diferenciais ordinárias em problemas de valor inicial
%
%       y(j+1) = y(j)+(1/6)*dy1+(1/3)*dy2+(1/3)*dy3+(1/6)*dy4
%       dy1 = h*f(t(j),y(j))
%       dy2 = h*f(t(j)+h/2,y(j)+dy1/2)
%       dy3 = h*f(t(j)+h/2,y(j)+dy2/2)
%       dy4 = h*f(t(j)+h,y(j)+dy3)
%
%   Variáveis de entrada
%      func: nome da função
%      tspan = [t0 tf]
%      y0: valores iniciais do vetor y
%      h: passo de integração
%
%   Variáveis de saída
%      t: tempo
%      y: variável dependente do tempo
%
n = length(y0);
to = tspan(1);
tf = tspan(2);
t = (to:h:tf)';
y = zeros(n,length(t));
y(:,1) = y0;
for j = 2:length(t)
    dy1 = h*(feval(func,t(j-1),y(:,j-1)));
    dy2 = h*(feval(func,t(j-1),y(:,j-1)+(1/2)*dy1));
    dy3 = h*(feval(func,t(j-1),y(:,j-1)+(1/2)*dy2));
    dy4 = h*(feval(func,t(j-1),y(:,j-1)+dy3));
    y(:,j) = y(:,j-1)+(1/6)*dy1+(1/3)*dy2+(1/3)*dy3+(1/6)*dy4;
end
y = y';