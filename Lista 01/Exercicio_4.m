%Calcular os Coeficientes ai, atraves do ajuste a = ((X'*X)^-1)*X'*Y
X = [1,0.25,25,0.25*25;1,0.75,25,0.75*25;1,0.25,45,0.25*45;1,0.75,45,0.75*45;1,0.5,35,0.5*35];
A = X';
B = A*X;
C = inv(B);
Y = [58.32;61.61;74.01;92.42;78.14];
a = C*A*Y;
a0 = a(1,1);
a1 = a(2,1);
a2 = a(3,1);
a3 = a(4,1);
%Teste da equação pegando os valores da tabela
Y1 = a0 + a1*0.25+a2*25+a3*0.25*25
Y2 = a0 + a1*0.75+a2*25+a3*0.75*25
Y3 = a0 + a1*0.25+a2*45+a3*0.25*45
Y4 = a0 + a1*0.75+a2*45+a3*0.75*45
Y5 = a0 + a1*0.5+a2*35+a3*0.5*35
%Realizando plotagem gráfica em 3D
x1 = linspace(0.25,0.75,5);
x2 = linspace(25,45,5);
[X1,X2] = meshgrid(x1,x2);
Z = a0 + a1.*X1 + a2.*X2 + a3.*X1.*X2;
surf(X1,X2,Z)
xlabel('catalisador (%)')
ylabel('Temperatura °C')
zlabel('Conversão (%)')




