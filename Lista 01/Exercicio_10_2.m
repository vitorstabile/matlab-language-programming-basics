%referencia ________http://www.colorado.edu/mechanical/programs/undergraduate/matlab_tutorials/fluids/moody.html
%Escrever uma function para a equação de Coolebrook
r = 50000;
k = 0.0001;
i = 1;
if r<2300
f = ('A Equação de Colebrook é valida para Reynolds >= 2300');
elseif k<0
f = ('A Rugosidade Relativa não pode ser negativa');
elseif k>0.05;
f = ('A Rugosidade Relativa não está no intervalo do diagrama de Moody');
else
    format long
f1 = 1;
f2 = ((1)/(0.86*(log((k/3.7)+(2.51/(r*sqrt(f1)))))))^2;
    while abs(f2 - f1)>0.000001
f1 = f2;
f2 = ((1)/(0.86*(log((k/3.7)+(2.51/(r*sqrt(f1)))))))^2;
i = i+1;
    end
end
f2
i