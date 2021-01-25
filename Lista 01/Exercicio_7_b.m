%Precisão para n = 100
pi = 3.141592653589;
k = 100;
n=(1:k);
V = [1./(((2*n-1).^2).*((2*n+1).^2))];
S = sum (V);
pi0 = sqrt(S*16+8);
d = abs(pi-pi0);
d

