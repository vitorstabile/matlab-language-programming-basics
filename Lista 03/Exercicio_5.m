%Fator de relaxamento
ro = 0.1;
%Chute Inicial
X = [0.25;1];
%Escrevendo as funções
f = zeros(2,1);
f(1,1) = ((X(1,1))^2)+2*((X(2,1))^3)-4*(X(1,1))*(X(2,1))-3;
f(2,1) = (X(1,1))+3*((X(1,1))^2)+(X(1,1))*(X(2,1))+(X(2,1))-2;
%Escrevendo a matriz Jacobiana das derivadas das funções
J = zeros(2,2);
J(1,1) = 2*(X(1,1))-4*(X(2,1));
J(1,2) = -4*(X(1,1))+6*((X(2,1))^2);
J(2,1) = 6*(X(1,1))+(X(2,1))+1;
J(2,2) = (X(1,1))+1;
%Resolvendo o sistema, e sabendo que J.Delta = -f. Enquanto o erro quadratico de f, for maior que a tolerancia
while ((f')*(f))>1e-7
    delta = -J\f;
    X = X+ro*delta;
%Recalculando as novas funções com os novos valores de X
f(1,1) = ((X(1,1))^2)+2*((X(2,1))^3)-4*(X(1,1))*(X(2,1))-3;
f(2,1) = (X(1,1))+3*((X(1,1))^2)+(X(1,1))*(X(2,1))+(X(2,1))-2;
%Recalculando a Matriz Jacobiana, com os novos valores de X
J(1,1) = 2*(X(1,1))-4*(X(2,1));
J(1,2) = -4*(X(1,1))+6*((X(2,1))^2);
J(2,1) = 6*(X(1,1))+(X(2,1))+1;
J(2,2) = (X(1,1))+1;
end
X