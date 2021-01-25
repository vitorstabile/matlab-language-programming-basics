function [x,i] = jacobi(A,b,xi,tol)
i=1;
D = diag(diag(A));
inv_D = inv(D);
n = length(b);
t1 = inv_D*b;
t2 = inv_D*A-eye(n);
x = xi;
while (((A*x-b)')*(A*x-b))>tol
    x = t1 - t2*x;
    i=i+1;
end