function f = Exercicio_1_Temperatura(T)
    x0 = [0.03;0;T];
    [t,x] = ode45('Exercicio_1_fermentacao',[0,1],x0);
    f = x(length(x),2);
end