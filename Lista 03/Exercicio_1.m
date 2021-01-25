i = 0;
%iremos utilizar um For, para o Calculo de cada V, para cada P, mantendo a Temperatura constante
for P = 101325:101325:4053000 %(Pa)
i = i+1;
%Chute Inicial
V = 1; %(M³/Kmol)
%Parametros de Entreda do n-butano
T = 500; %(K)
R = 8314; %(J/Kmol)
Tc = 425.2; %(K)
Pc = 3797000; %(Pa)
%Passo Utilizado para a Derivada
dx = 0.5; 
%Fator acentrico
fatoracentrico = 0.1931;
%Calculo do alfa
alfa = (1+((0.48508+1.55171*(fatoracentrico)-0.15613*(fatoracentrico^2))*(1-sqrt(T/Tc))))^2;
%Calculo dos parametros a e b
a = (0.4278*(R^2)*(Tc^2))/Pc;
b = (0.0867*R*Tc)/Pc;
%Escrevendo a função f(x) de SRK
f = -P+((R*T)/(V-b))-((a*alfa)/(V*(V+b)));
%Enquanto a função de SRK não for menor que a tolerancia de 10^-6.
while abs(f)>10e-6
%Calculando f(x+dx)
derivada = -P+((R*T)/((V+dx)-b))-((a*alfa)/((V+dx)*((V+dx)+b)));
%Calculando f'(x)
der = (derivada-f)/dx;
%Calculando o novo V com a formula de Newton-Raphson
V = V - f/der;
%Calculando f(x) novamente, com o novo valor de V
f = -P+((R*T)/(V-b))-((a*alfa)/(V*(V+b)));
VSoave_Redlich_Kwong(i) = V;
end
end
VSoave_Redlich_Kwong;
k = 0;
%Calculando V com a formula P.V=R.T para as mesma pressões
for P = 101325:101325:4053000
    k = k+1;
    %V = (R.T)/P
    Videal = (R*T)/P;
    Vgasideal(k) = Videal;
end
Vgasideal;
%Plotando o Gràfico de Ln(V) Vs Ln(P), comparando o desvio de V calculado para um gãs Ideal, e com a Formula de SRK
x = (101.325):(101.325):(4053.000);
x = log(x);
y1 = log(VSoave_Redlich_Kwong);
plot(x,y1)
hold on
y2 = log(Vgasideal);
plot (x,y2)
xlabel('Ln(Pressão(KPa))')
ylabel('Ln(Volume(m³/Kmol))')
legend('SRK','Gás Ideal')