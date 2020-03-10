clear all

% find n, s.t error < 0.00001
cnt = 1;
while abs(sin(pi) - sin_x(pi, cnt)) > 0.00001
    s_ans = sin(pi) - sin_x(pi, cnt);
    cnt = cnt + 1;
end

cnt = 1;
while abs(cos(pi) - cos_x(pi, cnt)) > 0.0001
    c_ans = cos(pi) - cos_x(pi, cnt);
    cnt = cnt + 1;
end

 function s = sin_x(x, k)
    s = 0;
    for n=0:k
        s = s + ((-1)^n * x^(2*n+1) / factorial(2*n+1));
    end
 end
 
 function c = cos_x(x, k)
    c = 0;
    for n=0:k
        c = c + ((-1)^n * (x^(2*n) / factorial(2*n)));
    end
 end
