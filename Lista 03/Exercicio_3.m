Fa0 = 12; %(mol/s)
DeltaHr = -1500000; %(J/mol)
Cpa = 4500; %(J/mol.k)
Ta = 50; %(°C)
T0 = 25; %(°C)
UA = 8400; %(W/k)
Tal = 10; %(s)
T = 250; %(°C -> Chute Inicial -> Chutar 70,100 e 250 para resultados diferentes. Logo depois, mudar ta para 20)
%Passo da derivada
dx = 0.5;
%Função
f = Cpa*((T+273)-(T0+273))+((UA)/(Fa0))*((T+273)-(Ta+273))+(((Tal*650*exp((-3800)/(T+273)))/(1+(Tal*650*exp((-3800)/(T+273))))))*DeltaHr;
%Enquanto a função for menor que a tolerancia
while abs(f) > 10e-6
    %Calculo de f(x+dx)
    derivada = Cpa*(((T+dx)+273)-(T0+273))+((UA)/(Fa0))*(((T+dx)+273)-(Ta+273))+(((Tal*650*exp((-3800)/((T+dx)+273)))/(1+(Tal*650*exp((-3800)/((T+dx)+273))))))*DeltaHr;
    %Calculo de f'(x)
    der = (derivada-f)/dx;
    %Aplicando o metodo de Newton-Raphson para o novo calculo de T
    T = T - f/der;
    %Calculo de f com o novo T calculado
    f = Cpa*((T+273)-(T0+273))+((UA)/(Fa0))*((T+273)-(Ta+273))+(((Tal*650*exp((-3800)/(T+273)))/(1+(Tal*650*exp((-3800)/(T+273))))))*DeltaHr;
end
T
X = (((Tal*650*exp((-3800)/(T+273)))/(1+(Tal*650*exp((-3800)/(T+273))))))