%Pelo m�todo de Gauss-Seidel
%Escrevendo a matriz A, b e xi
A = [1,1;-1,2];
b = [3;0];
%chute inicial
xi = [1;0.5];
%Sendo o sistema diagonal, a formula para Gauss-Seidel ?:
%Logo,em linguagem de programao, podemos escrever
%Calculo de X1
x(1,1) = (1/A(1,1))*((b(1,1))-(A(1,2)*xi(2,1)));
%Calculo de X2
x(2,1) = (1/A(2,2))*((b(2,1))-(A(2,1)*x(1,1)));
i = 1;
V1(i)=x(1,1);
V2(i)=x(2,1);
%Enquanto |X1-X0|>0.01
while abs(xi(1,1)-x(1,1))>0.01 || abs(xi(2,1)-x(2,1))>0.01
    xi = x;
    x(1,1) = (1/A(1,1))*((b(1,1))-(A(1,2)*x(2,1)));
    x(2,1) = (1/A(2,2))*((b(2,1))-(A(2,1)*x(1,1)));
    i=i+1;
    V1(i)=x(1,1);
    V2(i)=x(2,1);
end
i
X=[1,V1;0.5,V2]