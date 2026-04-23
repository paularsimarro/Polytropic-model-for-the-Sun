% Masa

% Masa para distintos valores de n
[theta0, xi0, M0] = lanem(x0, t0, p0, 0, h);
[theta1, xi1, M1] = lanem(x0, t0, p0, 1, h);
[theta15, xi15, M15] = lanem(x0, t0, p0, 1.5, h);
[theta3, xi3, M3] = lanem(x0, t0, p0, 3, h);
[theta5, xi5, M5] = lanem(x0, t0, p0, 5, h);

figure;
plot(xi0, M0)
hold on
plot( xi1,M1)
plot( xi15,M15)
plot( xi3,M3)
plot( xi5,M5)

legend('n=0', 'n=1', 'n=1.5', 'n=3', 'n=5')
xlabel('\theta')
ylabel('M_n(\theta)')
title('Gráfica de M_n(\theta) para distintos valores de n')
grid on
ylim([0.9 1.1]);
hold off
