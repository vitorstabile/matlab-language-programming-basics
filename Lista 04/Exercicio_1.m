T =10:50';
x=zeros(length(T),1);
for i=1:length(T)
    x(i)=Exercicio_1_Temperatura(T(i));
end
plot(T,x)
ylabel('Penicilina')
xlabel('Temperatura')