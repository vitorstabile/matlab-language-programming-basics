%Escrever uma function para a equa��o de Coolebrook
function [f,i] = cole(r,k)
i = 1;
if r<2300
f = ('A Equa��o de Colebrook � valida para Reynolds >= 2300')
i = 1;
elseif k<0
f = ('A Rugosidade Relativa n�o pode ser negativa');
i= 1;
elseif k>0.05;
f = ('A Rugosidade Relativa n�o est� no intervalo do diagrama de [A,B] = cole [5000,0.0001]Moody');
i = 1;
else
 format long
f1 = 1;
f = ((1)/(0.86*(log((k/3.7)+(2.51/(r*sqrt(f1)))))))^2;
 while abs(f - f1)>0.000001
f1 = f;
f = ((1)/(0.86*(log((k/3.7)+(2.51/(r*sqrt(f1)))))))^2;
i = i+1;
 end
end