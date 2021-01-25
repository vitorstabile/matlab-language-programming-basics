function [t,y]  = rk4(func,tspan,y0,h)
%
%   RK4: resolu��o de um sistema de EDOs
%        utilizando o m�todo cl�ssico de Runge-Kutta
%
%   rk4(func,tspan,y0,h): aplica��o do m�todo de Runge-Kutta
%   de quarta ordem na resolu��o de um sistema de equa��es
%   diferenciais ordin�rias em problemas de valor inicial
%
%       y(j+1) = y(j)+(1/6)*dy1+(1/3)*dy2+(1/3)*dy3+(1/6)*dy4
%       dy1 = h*f(t(j),y(j))
%       dy2 = h*f(t(j)+h/2,y(j)+dy1/2)
%       dy3 = h*f(t(j)+h/2,y(j)+dy2/2)
%       dy4 = h*f(t(j)+h,y(j)+dy3)
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
    dy1 = h*(feval(func,t(j-1),y(:,j-1)));
    dy2 = h*(feval(func,t(j-1),y(:,j-1)+(1/2)*dy1));
    dy3 = h*(feval(func,t(j-1),y(:,j-1)+(1/2)*dy2));
    dy4 = h*(feval(func,t(j-1),y(:,j-1)+dy3));
    y(:,j) = y(:,j-1)+(1/6)*dy1+(1/3)*dy2+(1/3)*dy3+(1/6)*dy4;
end
y = y';