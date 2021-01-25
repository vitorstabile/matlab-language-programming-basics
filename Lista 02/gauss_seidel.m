function [x,i] = gauss_seidel(A,b,xi,tol)
i=0;
n = length(b);
x = xi;
while (((A*x-b)')*(A*x-b))>tol
    for i = 1:n
        soma=0;
        for j = 1:n
            if j ~= i
                soma = A(i,j)*x(j)+soma;
            end
        end
        x(i)=(1/A(i,i))*(b(i)-soma);
    end
    i=i+1;
end