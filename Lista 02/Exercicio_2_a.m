%Aplicando Jacobi
A = [1,1;-1,2];
b = [3;0];
%chute inicial
xi = [0;0];
tol = 1e-06;
tic
[x,i]=jacobi(A,b,xi,tol)
toc