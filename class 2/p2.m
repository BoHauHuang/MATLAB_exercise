tic

d = 0.0001;
func = @(x)exp(x);
real = integral(func, 0, 10);
f = 0:d:10;

val = func(f);
calculate = (sum(val)*2-val(1)-val(end))*d/2;

dif = abs(calculate - real);

toc