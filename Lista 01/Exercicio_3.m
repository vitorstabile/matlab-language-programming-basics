%Exercicio 02 - Lista 01
A11 = [1,0;0,-1];
A12 = zeros(2,2);
A22 = [1,1;0,0];
%a) Construa a matriz A constituida de [A11,A12;A12,A22]
A = [A11,A12;A12,A22]
%b) Determinar o menor valor de n inteiro e positivo, diferente de 1, que
%satisfa�a a rela��o A^n = A
%O pr�ximo valor, diferente de 1, positivo e inteiro, ser� n = 2.
%B = A^n
%C = sum(sum(A)) == sum(sum(B))
%Se a igualdade acima for verdadeira, o valor de C ser� 1, caso
%contrario ser� falso, logo 0.
%Como C � 0, iremos testar com n = 3
%Como C � 1, a igualdade � verdadeira, logo, o menor valor de n,
%positivo e inteiro, diferente de 1, que satisfa�a a igualdade A^n =
%A � 3

