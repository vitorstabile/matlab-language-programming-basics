n = 9;
F = 100;
z = [0.8345,0.0046,0.0381,0.0163,0.005,0.0074,0.0287,0.022,0.0434];
K = [3.09,1.65,0.72,0.39,0.21,0.175,0.093,0.065,0.036];
soma1 = 0;
soma2 = 0;
dx = 0.5;
V=83;
%Funçao
    for i = 1:n
        soma1 = soma1 + ((z(i)*K(i)*F)/(V*(K(i)-1)+F));
    end
f = soma1 - 1;
while abs(f)>1e-4
%Derivada
soma2 = 0;
    for i = 1:n
        soma2 = soma2 + ((z(i)*K(i)*F)/((V+dx)*(K(i)-1)+F));
    end
fder = soma2 - 1;
derivada = (fder-f)/dx;
V = V-(f/derivada);
%recalculando a função
soma1 = 0;
    for i = 1:n
        soma1 = soma1 + ((z(i)*K(i)*F)/(V*(K(i)-1)+F));
    end
f = soma1 - 1;
end
V
L = F-V
for i= 1:n
    x(i) = ((z(i)*F))/(L+K(i)*V);
    y(i) = K(i)*x(i);
end
x
y