clear all
clc
h = 0.05;
tspan = [0,9];
y0 = [0.5;0;0;50];
[t,y] = rk4('Exercicio_5_6_glucose',tspan,y0,h);
Celulas = y(:,1)
Gluconoctone = y(:,2)
AcidoGluconico = y(:,3)
Glucose = y(:,4)
tempo = t
plot(tempo,Celulas)
hold on
plot(tempo,Gluconoctone)
plot (tempo,AcidoGluconico)
plot(tempo,Glucose)
xlabel('h')
ylabel('mg/mL')
legend('Celulas','Gluconoctone','AcidoGluconico','Glucose')