x = linspace(-3, 3, 30);
y = linspace(-3, 3, 30);
[xx, yy] = meshgrid(x, y);
term1 = (3.*(1-xx).^2).*exp((-(xx).^2)-(yy+1).^2);
term2 = 10.*((xx./5)-(xx).^3-(yy).^5).*exp((-(xx).^2)-(yy).^2);
term3 = (1/3).*exp((-(xx+1).^2)-(yy).^2);
zz = term1-term2-term3;

meshc(xx, yy, zz);
colormap('default');
colorbar;