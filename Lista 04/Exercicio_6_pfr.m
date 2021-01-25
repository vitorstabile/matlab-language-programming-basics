function f = Exercicio_6_pfr(V,y)
    f = zeros(3,1);
    rd = 60*(y(1,1)/15);
    ru = (0.003*(y(1,1)/15))/(1+1e5*(y(1,1)/15));
    f(1,1) = -rd -ru;
    f(2,1) = rd;
    f(3,1) = ru;
end