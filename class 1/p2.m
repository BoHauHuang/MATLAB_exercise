clear all

func = @(x)exp(x);
real = integral(func, 0, 10);
calculate = 0;
d = 0.0005;

for n=0:d:10
    calculate = calculate + (d * exp(n));
end

diff = abs(calculate - real);