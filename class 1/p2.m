clear all

func = @(x)exp(x);
real = integral(func, 0, 10);
caculate = 0;
d = 0.0005;

for n=0:d:10
    caculate = caculate + (d * exp(n));
end

diff = abs(caculate - real);