
n=1;
soma=0;
pi0=0;
i=0;
while abs(pi0-pi)>10^-12
    soma = (1/(((2*n-1)^2)*((2*n+1)^2)))+soma;
    pi0 = sqrt(soma*16+8);
    i=i+1;
    n=n+1;
end
i