%Escrever uma function que valide um quadrado mágico
function f = quamag(A)
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
f = ('Por Favor, inserir uma matriz quadrada')
elseif I==J && G==H && K==L && C==D
f = ('1-Sua matriz é um quadrado mágico')
else
 f = ('0-Sua matriz não é um quadrado mágico')
end