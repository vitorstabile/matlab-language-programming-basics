function f = teste(V)
n = 6;
F = 100;
z = [0.875,0.04,0.018,0.014,0.03,0.023];
K = [1.545,0.36,0.195,0.105,0.046,0.032];
soma = 0;
    for i = 1:n
        soma = soma + ((z(i)*K(i)*F)/(V*(K(i)-1)+F));
    end
        f = soma - 1;