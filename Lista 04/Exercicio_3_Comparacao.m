clear all
clc
A = [-4,1;4,-4];
h = 0.05;
x0 = [100;0];
t = 5;
i = 1;
for j = 0:h:t
    x(:,i) = expm(A*j)*x0;
    tempo(i) = j;
    i = i+1;
end
x;
Analitico=x(1,:)'
tempo';
plot(tempo,Analitico)
hold on
clear all
h = 0.05;
tspan = [0,5];
y0 = [100;0];
[t,y] = euler_expl('Exercicio_3_btr',tspan,y0,h);
tempo = t
Euler = y(:,1)
plot(tempo,Euler)
clear all
h = 0.05;
tspan = [0,5];
y0 = [100;0];
[t,y] = rk4('Exercicio_3_btr',tspan,y0,h);
tempo = t
Ruge_Kutta = y(:,1)
plot(tempo,Ruge_Kutta)
xlabel('h')
ylabel('Mol/m³')
legend('Analitico','Euler','Ruge_Kutta')