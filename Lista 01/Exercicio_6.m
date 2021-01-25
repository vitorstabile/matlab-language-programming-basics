%Construir um Script para polinômios de Legendre e contruir o gráficos desses 6 polinomios
syms x;
k = 7;
n = 1;
P=sym([0,1,x]);
while length (P) ~= k
P(1,n+3)=(((2*(n))+1)*x*P(1,n+2)-(n)*P(1,n+1))/(n+1);
n = n+1;
end
P(1,2)
P(1,3)
P(1,4)
P(1,5)
P(1,6)
P(1,7)
ezplot(x,P(1,2),[-1,1])
hold on
ezplot(x,P(1,3),[-1,1])
ezplot(x,P(1,4),[-1,1])
ezplot(x,P(1,5),[-1,1])
ezplot(x,P(1,6),[-1,1])
ezplot(x,P(1,7),[-1,1])
title('Gráfico do comportamento do Polinômio de Legendre de n=1 a n=6')
legend('n=0','n=1','n=2','n=3','n=4','n=5','n=6','Location','southeast')
