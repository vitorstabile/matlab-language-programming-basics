function [x,count] = monte_carlo(func,a,b,tol)
    c = (b-a)*rand(1)+a;
    fa = feval(func,a);
    fc = feval(func,c);
count= 0;
while abs(a-b)>tol
    if (fa*fc)<0
        b = c;
    else
        a = c;
    end
    c = (b-a)*rand(1)+a;
    fa = feval(func,a);
    fc = feval(func,c);
count = 1+count;
end
x = a;
count;