clear all
clc
h = 0.05;
tspan = [0,5];
y0 = [100;0];
[t,y] = rk4('Exercicio_3_btr',tspan,y0,h);
A = y(:,1)
B = y(:,2)
tempo = t
plot(tempo,A)
hold on
plot(tempo,B)
xlabel('h')
ylabel('Mol/m³')
legend('A','B')