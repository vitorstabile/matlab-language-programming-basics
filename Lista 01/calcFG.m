%Escrever uma function que tenha como entrada um número n >= 1 e sua saída seja os valores de Fn e Gn
function [G,F] = calcFG(n)
k=3;
if n == 1
F = [2,1];
G = [1,2];
F = F(1,1);
G = G(1,1);
elseif n == 2
F = [2,1];
G = [1,2];
F = F(1,2);
G = G(1,2);
elseif n>=3
F = [2,1];
G = [1,2];
    while length (F) ~= n && length (G) ~= n
    F(1,k) = 2*F(1,k-1)+G(1,k-2);
    G(1,k) = G(1,k-1)+3*F(1,k-2);
    k = k+1;
    end
end
F = F(1,n);
G = G(1,n);