%b) Determinar o menor valor de n inteiro e positivo, diferente de 1, que
%satisfaça a relação A^n = A
function n = calc(n0) 
A11 = [1,0;0,-1];
A12 = zeros(2,2);
A22 = [1,1;0,0];
A = [A11,A12;A12,A22];
B = A^n0;
C = round(n0);
D = mod(n0,C);
if n0 <= 1 | D>0
    B = ['n não é positivo, inteiro ou diferente de 1']
elseif sum(sum(A)) == sum(sum(B))
n = n0
else sum(sum(A)) ~= sum(sum(B))
n = n0+1
end
end