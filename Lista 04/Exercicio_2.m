clear all
clc
k1=3;
k2=1;
A = [-k1,0,0;k1,-k2,0;0,k2,0];
h = 0.05;
x0 = [1;0;0];
t = 10;
i = 1;
for j = 0:h:t
    x(:,i) = expm(A*j)*x0;
    tempo(i) = j;
    i = i+1;
end
x;
A=x(1,:)'
B =x(2,:)'
C =x(3,:)'
tempo'
plot(tempo,A)
hold on
plot(tempo,B)
plot(tempo,C)
xlabel('s')
ylabel('Mol/m³')
legend('A','B','C')