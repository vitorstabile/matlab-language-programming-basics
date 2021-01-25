%Repetição do Exercicio 1
i = 0;
for P = 101325:101325:4053000
i = i+1;
V = 1;
T = 500;
R = 8314;
Tc = 425.2;
Pc = 3797000;
dx = 0.5;
facentric = 0.1931;
alfa = (1+((0.48508+1.55171*(facentric)-0.15613*(facentric^2))*(1-sqrt(T/Tc))))^2;
a = (0.4278*(R^2)*(Tc^2))/Pc;
b = (0.0867*R*Tc)/Pc;
f = -P+((R*T)/(V-b))-((a*alfa)/(V*(V+b)));
while abs(f)>10e-6
derivada = -P+((R*T)/((V+dx)-b))-((a*alfa)/((V+dx)*((V+dx)+b)));
der = (derivada-f)/dx;
V = V - f/der;
f = -P+((R*T)/(V-b))-((a*alfa)/(V*(V+b)));
VSoave_Redlich_Kwong(i) = V;
end
end
VSoave_Redlich_Kwong
 k = 0;
for P = 101325:101325:4053000
    k = k+1;
    Videal = (R*T)/P;
    Vgasideal(k) = Videal;
end
Vgasideal
%Começo do Exercicio 2
i = 0;
%iremos utilizar um For, para o Calculo de cada V, para cada P, mantendo a Temperatura constante
for P = 1:1:40 %(atm)
    i = i+1;
    V = 1; %(Chute inicial L/mol)
    T = 500; %(K)
    %Parametros do n - butano
    A0 = 10.0847;
    a = 1.88231;
    alfa = 1.10132e-3;
    B0=0.124361;
    b= 0.0399983;
    gama = 3.400e-2;
    C0 = 0.992830e6;
    c = 0.316400e6;
    R = 0.08206; %(L.Atm/Mol.K)
    dx = 0.5; %(Passo da derivada)
    %Escrevendo a função f(x) de BWR
    f = -P+((R*T)/(V))+(((B0*R*T)-A0-(C0/T^2))/(V^2))+(((b*R*T)-a)/(V^3))+((a*alfa)/(V^6))+(c/((V^3)*(T^2)))*(1+(gama/(V^2)))*exp(-gama/(V^2));
    %Enquanto a função de BWR não for menor que a tolerancia de 10^-6.
    while abs(f)>10e-6
    %Calculando f(x+dx)
    derivada = -P+((R*T)/(V+dx))+(((B0*R*T)-A0-(C0/T^2))/((V+dx)^2))+(((b*R*T)-a)/((V+dx)^3))+((a*alfa)/((V+dx)^6))+(c/(((V+dx)^3)*(T^2)))*(1+(gama/((V+dx)^2)))*exp(-gama/((V+dx)^2));
    %Calculando f'(x)
    der = (derivada-f)/dx;
    %Calculando o novo V com a formula de Newton-Raphson
    V = V - f/der;
    %Calculando f(x) novamente, com o novo valor de V
    f = -P+((R*T)/(V))+(((B0*R*T)-A0-(C0/T^2))/(V^2))+(((b*R*T)-a)/(V^3))+((a*alfa)/(V^6))+(c/((V^3)*(T^2)))*(1+(gama/(V^2)))*exp(-gama/(V^2));
    VBenedict_webb_rubin(i) = V;
    end
end
VBenedict_webb_rubin
    i = 0;
%iremos utilizar um For, para o Calculo de cada V, para cada P, mantendo a Temperatura constante
    for P = 1:1:40
    i = i+1;
    V = 1; %Chute Inicial L/Mol
    T = 500; %(K)
    R = 0.08206; %(Atm.L/Mol.K)
    Tc = 425.2; %(K)
    Pc = 37.4734; %(Atm)
    %(passo da derivada)
    dx = 0.5;
    %Calculo dos parametros da Equação
    facentric = 0.1931;
    F = 0.452413+1.30982*(facentric)-0.295937*(facentric^2);
    zeta = 0.329032 - 0.076799*(facentric)+0.0211947*(facentric^2);
    omegac = 1-3*zeta;
    %Calculo da Primeira raiz da função Omegab
    omegab = fzero('calc_omega_b',1);
    omegaa = 3*(zeta^2)+3*(1-2*zeta)*omegab+(omegab^2)+1-3*zeta;
    a = omegaa*(((R^2)*(Tc^2))/(Pc))*((1+F*(1-sqrt(T/Tc)))^2);
    b = omegab*((R*Tc)/Pc);
    c = omegac*((R*Tc)/Pc);
    %%Escrevendo a função f(x) de PT
    f = -P +((R*T)/(V-b))-((a)/(V*(V+b)+c*(V-b)));
    %Enquanto a função de BWR não for menor que a tolerancia de 10^-6.
      while abs(f)>10e-6
          %Calculo de f(x+dx)
      derivada = -P +((R*T)/((V+dx)-b))-((a)/((V+dx)*((V+dx)+b)+c*((V+dx)-b)));
      %Calculo de f'(x)
      der = (derivada-f)/dx;
      %Calculando o novo V com a formula de Newton-Raphson
      V = V - f/der;
      %Calculando f(x) novamente, com o novo valor de V
      f = -P +((R*T)/(V-b))-((a)/(V*(V+b)+c*(V-b)));
      VPatel_Teja(i) = V;
      end
    end
    VPatel_Teja
    %Plotando o Gràfico de Ln(V) Vs Ln(P), comparando os desvios de V
x = 101.325:101.325:4053.000;
x = log(x);
y1 = log(VSoave_Redlich_Kwong);
plot(x,y1)
hold on
y2 = log(Vgasideal);
plot (x,y2)
y3 = log(VBenedict_webb_rubin);
plot (x,y3)
y4 = log(VPatel_Teja);
plot(x,y4)
xlabel('Ln(Pressão(KPa))')
ylabel('Ln(Volume(m³/Kmol))')
legend('SRK','Gás Ideal','BWR','PT')