%Exercicio 02 - Lista 01
A11 = [1,0;0,-1];
A12 = zeros(2,2);
A22 = [1,1;0,0];
%a) Construa a matriz A constituida de [A11,A12;A12,A22]
A = [A11,A12;A12,A22]
%b) Determinar o menor valor de n inteiro e positivo, diferente de 1, que
%satisfaça a relação A^n = A
%O próximo valor, diferente de 1, positivo e inteiro, será n = 2.
%B = A^n
%C = sum(sum(A)) == sum(sum(B))
%Se a igualdade acima for verdadeira, o valor de C será 1, caso
%contrario será falso, logo 0.
%Como C é 0, iremos testar com n = 3
%Como C é 1, a igualdade é verdadeira, logo, o menor valor de n,
%positivo e inteiro, diferente de 1, que satisfaça a igualdade A^n =
%A é 3

