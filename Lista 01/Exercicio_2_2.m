%Matriz para A^n onde n são números inteiros
function A^n = calcAn(n)
A = [1,1/3;0,1/4];
E = A^n;
F = round(n);
G = mod(n,F);
if G>0 
    E = ['digitar um numero inteiro']
else
   A^n = E
end
