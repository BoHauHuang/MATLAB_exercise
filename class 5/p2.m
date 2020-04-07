
v = [1, 2, 3; 0, -1, 2 ; 1, 1, 0];
v'
result = GSO(v');

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
    for i = 1:length(u)
        u(:, i) = u(:, i)/norm(u(:, i));
    end
end