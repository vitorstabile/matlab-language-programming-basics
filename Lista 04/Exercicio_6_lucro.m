clear all
clc
tspan = [0,3]; % Chute inicial de estudo do Volume
y0 = [0.1;0;0]; %Fa0
h = 0.01;
[t,y]  = rk4('Exercicio_6_pfr',tspan,y0,h);
A = y(:,1);
D = y(:,2);
U = y(:,3);
volume = t;
lucro = D*35-A*5-U*10
plot(volume,lucro)
xlabel('L');
ylabel('$/s')