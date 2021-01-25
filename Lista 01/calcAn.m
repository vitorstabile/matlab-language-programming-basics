function An = calcAn(n)
A = [1,1/3;0,1/4];
An = A^n;
F = round(n);
G = mod(n,F);
if G>0
 An = ['digitar um numero inteiro']
else
 An
end