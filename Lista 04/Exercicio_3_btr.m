function f = Exercicio_3_btr(t,x)
    f = zeros(2,1);
    f(1,1) = -4*x(1,1) + 1*x(2,1);
    f(2,1) = 4*x(1,1) -4*x(2,1);
end