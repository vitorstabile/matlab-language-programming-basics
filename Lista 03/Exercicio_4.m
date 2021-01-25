%Parametros Iniciais
n = 6;
F = 100;
z = [0.875,0.04,0.018,0.014,0.03,0.023];
K = [1.545,0.36,0.195,0.105,0.046,0.032];
%Intervalo de troca de sinal da função
a = 5;
b = 95;
%Calculo do ponto medio do intervalo de a e b
c = (a + b)/2;
A = 0;
B = 0;
C = 0;
%Calculo do fator soma da função em relacao ao ponto a
    for i = 1:n
        A = A + ((z(i)*K(i)*F)/(a*(K(i)-1)+F));
    end
%Calculo de fa
    fa = A - 1;
%Calculo do fator soma da função em relacao ao ponto b   
    for i = 1:n
        B = B + ((z(i)*K(i)*F)/(b*(K(i)-1)+F));
    end
%Calculo de fb
    fb = B - 1;
%Calculo do fator soma da função em relacao ao ponto b   
    for i = 1:n
        C = C + ((z(i)*K(i)*F)/(c*(K(i)-1)+F));
    end
%Calculo de fa
    fc = C - 1;
    cont= 0;
%Enquanto a diferença entre a e b, for maior que a tolerancia
    while abs(a-b)>1e-3
%Se fa calculado tiver valor diferente de fc calculado
        if (fa*fc)<0
% b recebe o valor de c
            b = c;
%caso contrario, a recebe c
        else
            a = c;
        end
%Calculo do novo valor do ponto medio em relacao ao novo intervalo entre a e b
        c = (a+b)/2;
%Calculo os novos valores de fa, fb e fc, com os novos valores de a ou b, e c
        A = 0;
        for i = 1:n
        A = A + ((z(i)*K(i)*F)/(a*(K(i)-1)+F));
        end
        fa = A - 1;
        B = 0;
        for i = 1:n
        B = B + ((z(i)*K(i)*F)/(b*(K(i)-1)+F));
        end
        fb = B-1;
        C = 0;
        for i = 1:n
        C = C + ((z(i)*K(i)*F)/(c*(K(i)-1)+F));
        end
        fc = C - 1;
        cont = cont+1;
    end
V = a;
V
cont