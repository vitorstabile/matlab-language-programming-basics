%Calculo da Precis�o da Serie
n = 1;
k = 1;
i=1
V = [1./(((2*n-1).^2).*((2*n+1).^2))];
S = sum(V);
pi0 = sqrt(S*16+8);
while abs(pi0-pi)>10^-12
    k=k+1;
    n=(1:k);
    V = [1./(((2*n-1).^2).*((2*n+1).^2))];
    S = sum (V);
    pi0 = sqrt(S*16+8);
    i=i+1;
end
format long
