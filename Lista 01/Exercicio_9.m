%Escrever uma function que valide um quadrado mágico
A = magic(12)
B = size(A);
C = B(1,1);
D = B(1,2);
E = sum(A);
F = sum(A');
G = sum(diag(A));
H = sum(diag(fliplr(A)));
I = sum(sum(A));
J = sum(sum(A'));
K = I+J;
L = C*(G+H);
if C~=D
A = ('Por Favor, inserir uma matriz quadrada')
elseif I==J && G==H && K==L && C==D
    A = 1
else
    A = 0
end