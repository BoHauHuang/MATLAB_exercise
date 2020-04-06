a = 4;
b = 5;

f = @(x) x-tan(x);
error = abs(a-b);

while error >= 10e-15
    c = (a+b)/2;
    if f(a)*f(c) < 0
        b = c;
    elseif f(b)*f(c) < 0
        a = c;
    end
    error = abs(a-b);
end

fprintf('¸Ñ=%.20f, »~®t=%.20f\n', c, error);


