n1 = 1;
n2 = 1.45;
theta1 = 0:1:90;

top = n1.*cosd(theta1)-n2.*sqrt(1-sind((n1/n2).*theta1));
bot = n1.*cosd(theta1)+n2.*sqrt(1-sind((n1/n2).*theta1));
R = (top./bot).^2;

subplot(1, 2, 1);
plot(R);
title('TE, n1=1, n2=1.45');
xlabel('�J�g��');
ylabel('�Ϯg�v');
axis([0, 90, 0, 1]);

subplot(1, 2, 2);
plot(1-R);
title('TE, n1=1, n2=1.45');
xlabel('�J�g��');
ylabel('��z�v');
axis([0, 90, 0, 1]);