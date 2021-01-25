clear all
clc
h = 1;
tspan = [0,212];
y0 = [5;0];
[t,y] = rk4('Exercicio_4_fermentacao',tspan,y0,h);
y1 = y(:,1)
y2 = y(:,2)
tempo = t
plot(tempo,y1)
hold on
plot(tempo,y2)
xlabel('h')
ylabel('y2')
legend('y1','y2')