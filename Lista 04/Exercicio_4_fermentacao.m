function f = Exercicio_4_fermentacao(t,y)
    f = zeros(2,1);
    k1 = 0.0312;
    k2 = 47.7;
    k3 = 3.374;
    k4 = 0.01268;
    f(1,1) = k1*y(1,1)-(k1*(y(1,1)^2))/k2;
    f(2,1) = k3*y(1,1)-k4*y(2,1);
end