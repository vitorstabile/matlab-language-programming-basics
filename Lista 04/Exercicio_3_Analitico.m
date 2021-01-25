clear all
clc
A = [-4,1;4,-4];
h = 0.05;
x0 = [100;0];
t = 5;
i = 1;
for j = 0:h:t
    x(:,i) = expm(A*j)*x0;
    tempo(i) = j;
    i = i+1;
end
x;
A=x(1,:)'
B =x(2,:)'
tempo'
plot(tempo,A)
hold on
plot(tempo,B)
xlabel('h')
ylabel('Mol/m³')
legend('A','B')