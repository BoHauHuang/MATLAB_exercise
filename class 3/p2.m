d = 0.01;
n_frames = 4;
x_frames = 2;
y_frames = 2;

fs = [fourier_series(1)', fourier_series(10)', fourier_series(100)', fourier_series(1000)'];

for i = 1:n_frames
    subplot(x_frames, y_frames, i);
    plot(0:d:10, fs(:, i));
    title(strcat('¤èªifourier n=', num2str(i)));
    xlabel('x');
    ylabel('y');
end

function fs = fourier_series(n_max)
    cnt = 1;
    d = 0.01;
    fs = linspace(0, 0, 10/d);
    for x = 0:d:10
        sum = 0;
        for n = 1:1:n_max
            sum = sum + 2/(n*pi)*sin(n*pi/2)*cos(n*pi*x/2);
        end
        fs(cnt) = sum + 1/2;
        cnt = cnt + 1;
    end
end
