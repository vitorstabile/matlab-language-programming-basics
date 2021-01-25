%b) escrevendo um scrip em função de n e nf
n = 10;
nf = 7;
W = 100;
F = 13;
S = 10;
X0 = 0.05;
Y0 = 0;
nf0 = 0.003;
m = 9;
A = zeros(2*n,2*n);
b = zeros(2*n,1);
for j = 1:n 
    if j == 1 
        A(j,j) = -W;
        A(1,n+j) = -(S+F);
        A(1,n+j+1) = +(S+F);
        b(j,1) = -W*X0;
    elseif j<nf
        A(j,j-1)= W;
        A(j,j)= -W;
        A(j,j+n)= -(S+F);
        A(j,j+n+1)= +(S+F);
    elseif j == nf
        A(j,j-1)= W;
        A(j,j)= -W;
        A(j,j+n)= -(S+F);
        A(j,j+n+1)= S;
        b(j,1)= -F*nf0;
    elseif j>nf && j<n
        A(j,j-1)= W;
        A(j,j)= -W;
        A(j,j+n)= -(S);
        A(j,j+n+1)= S;
    else j = n;
        A(j,j-1) = W;
        A(j,j) = -W;
        A(j,n+j) = -(S);
        b(j,1) = -S*Y0;
        
    end
end
for k = n+1:2*n
    A(k,k-n)= m;
    A(k,k)= -1;
end
x = A\b
rec = (X0-x(n))/(X0)