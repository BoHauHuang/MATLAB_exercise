x = -2:0.1:2;
y = -2:0.1:2;

[xx, yy] = meshgrid(x, y);
top = abs(xx).*abs(yy);
bot = (xx.^2+yy.^2).^0.5;
zz_mesh = exp(-top./bot);

[fx, fy] = gradient(zz_mesh);

contourf(x, y, zz_mesh);
colormap('jet');
colorbar;
hold on;
quiver(xx, yy, fx, fy);