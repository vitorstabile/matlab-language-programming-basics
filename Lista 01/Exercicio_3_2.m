%b) Determinar o menor valor de n inteiro e positivo, diferente de 1, que
%satisfaça a relação A^n = A.
%O menor valor, diferente de 1 e positivo será n = 2, porém, se fizermos A^2, a matriz A^2 ~= A.
A11 = [1,0;0,-1];
A12 = zeros(2,2);
A22 = [1,1;0,0];
A = [A11,A12;A12,A22];
n=3;
B = A^n;
C = sum(sum(A)) == sum(sum(B))

    