%Pelo m?todo de Jacobi
%Escrevendo a matriz A, b e xi
A = [1,1;-1,2];
b = [3;0];
%chute inicial
xi = [1;0.5];
%Logo,podemos definir
D = diag(diag(A));
n = length(b);
I = eye(n);
Dinv = inv(D);
%Pela formula
x = (Dinv*b)-(Dinv*A-I)*xi;
i = 1;
V1(i)=x(1,1);
V2(i)=x(2,1);
while abs(xi(1,1)-x(1,1))>0.01 || abs(xi(2,1)-x(2,1))>0.01
    xi = x;
    x = (Dinv*b)-(Dinv*A-I)*xi;
    i=i+1;
    V1(i)=x(1,1);
    V2(i)=x(2,1);
end
i
X=[1,V1;0.5,V2]