tic

func = @(x)exp(x);
real = integral(func, 0, 10);
calculate = 0;
d = 0.0001;

for i = 0:d:10-d
    calculate = calculate + d*(func(i)+func(i+d))/2;
end
dif = abs(calculate - real);

toc 