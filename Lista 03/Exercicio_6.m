%paramentros iniciais
tal = 0.5;
X1i = 0.01;
X2i = 0.02;
K1 = 55;
K2 = 30;
%Fator de Relaxamento
ro = 0.1;
%Chute Inicial
X = [0.005;0.01;0.005];
%Escrevendo as funções
f = zeros(3,1);
f(1,1) = (X1i-X(1,1))-K1*tal*X(1,1)*((X(2,1)^0.5));
f(2,1) = (X2i-X(2,1))-tal*(K1*X(1,1)*(X(2,1)^0.5)+K2*(X(2,1)^0.5)*X(3,1));
f(3,1) = -X(3,1)+tal*(K1*X(1,1)*(X(2,1)^0.5)-K2*(X(2,1)^0.5)*X(3,1));
%Escrevendo a matriz Jacobiana das derivadas das funções
J = zeros(3,3);
J(1,1) = -1-K1*tal*(X(2,1)^0.5);
J(1,2) = -K1*tal*X(1,1)*0.5*(X(2,1)^-0.5);
J(1,3) = 0;
J(2,1) = -tal*K1*(X(2,1)^0.5);
J(2,2) = -1-tal*(K1*X(1,1)*0.5*(X(2,1)^-0.5)+K2*X(3,1)*0.5*(X(2,1)^-0.5));
J(2,3) = -tal*(K2*(X(2,1)^0.5));
J(1,3) = +tal*(K1*(X(2,1)^0.5));
J(2,3) = tal*(K1*X(1,1)*0.5*(X(2,1)^-0.5)-K2*X(3,1)*0.5*(X(2,1)^-0.5));
J(3,3) = -1 + tal*(-K2*(X(2,1)^0.5));
%Resolvendo o sistema, e sabendo que J.Delta = -f. Enquanto o erro quadratico de f, for maior que a tolerancia
while abs((f')*(f))>1e-8
    delta = -J\f;
    X = X+ro*delta;
%Recalculando as novas funções com os novos valores de X
f(1,1) = (X1i-X(1,1))-K1*tal*X(1,1)*((X(2,1)^0.5));
f(2,1) = (X2i-X(2,1))-tal*(K1*X(1,1)*(X(2,1)^0.5)+K2*(X(2,1)^0.5)*X(3,1));
f(3,1) = -X(3,1)+tal*(K1*X(1,1)*(X(2,1)^0.5)-K2*(X(2,1)^0.5)*X(3,1));
%Recalculando a Matriz Jacobiana, com os novos valores de X
J(1,1) = -1-K1*tal*(X(2,1)^0.5);
J(1,2) = -K1*tal*X(1,1)*0.5*(X(2,1)^-0.5);
J(1,3) = 0;
J(2,1) = -tal*K1*(X(2,1)^0.5);
J(2,2) = -1-tal*(K1*X(1,1)*0.5*(X(2,1)^-0.5)+K2*X(3,1)*0.5*(X(2,1)^-0.5));
J(2,3) = -tal*(K2*(X(2,1)^0.5));
J(1,3) = +tal*(K1*(X(2,1)^0.5));
J(2,3) = tal*(K1*X(1,1)*0.5*(X(2,1)^-0.5)-K2*X(3,1)*0.5*(X(2,1)^-0.5));
J(3,3) = -1 + tal*(-K2*(X(2,1)^0.5));
end
X