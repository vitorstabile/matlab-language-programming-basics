%Aplicando Gauss_Seidel
A = [1,1;-1,2];
b = [3;0];
%chute inicial
xi = [0;0];
tol = 1e-06;
tic
[x,i]=gauss_seidel(A,b,xi,tol)
toc