
v = [3, 2; 1, 2];

result = GSO(v);

function u = GSO(v)
    u = v;
    
    for i=1:length(v)
        u(:, i) = v(:, i);
        sub = 0;
        if i ~= 1
            for j = 1:i-1
                top = dot(v(:, i), u(:, j));
                bot = dot(u(:, j), u(:, j));
                sub = sub + (top/bot)*u(:, j);
            end
        end
        u(:, i) = u(:, i)-sub;
    end
    
    u = u/norm(u);
end