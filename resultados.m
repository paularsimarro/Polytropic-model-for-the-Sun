clear
n_val=[0,1,1.5,3,5];
x0=0;
t0=1;
p0=0;
h=0.0001;
xm=10; %maximo valor de x

Graficas theta(xi)
figure;
hold on;
for j = 1:length(n_val)
    n = n_val(j);
    [theta, xi] = lane(x0, t0, p0, n, h);
    plot(xi, theta, 'DisplayName', ['n = ' num2str(n)]);
end


xlabel('\xi');
ylabel('\theta(\xi)');
title('Gráfica de \theta(\xi) para distintos valores de n');
ylim([0 inf]); 
legend show;
grid on;
hold off;

Graficas theta(xi)^n
n_values = [0, 1, 1.5, 3, 5];
figure;
hold on;
for j = 1:length(n_values)
    n = n_values(j);
    [theta, xi] = lane(0, 1, 0, n, 0.0001);
    theta_n = abs(theta).^n;
    plot(xi, theta_n, 'DisplayName', ['n = ' num2str(n)]);
end

xlabel('\xi');
ylabel('\theta(\xi)^n');
title('Gráfica de \theta(\xi)^n para distintos valores de n');
legend show;
grid on;
hold off;

Graficas theta(xi)^n+1
n_values = [0, 1, 1.5, 3, 5];
figure;
hold on;
for j = 1:length(n_values)
    n = n_values(j);
    [theta, xi] = lane(0, 1, 0, n, 0.0001);
    theta_n = abs(theta).^(n+1);
    plot(xi, theta_n, 'DisplayName', ['n = ' num2str(n)]);
end
xlabel('\xi');
ylabel('\theta(\xi)^{n+1}');
title('Gráfica de \theta(\xi)^{n+1} para distintos valores de n');
legend show;
grid on;
hold off;


n_val=[0,1,1.5,3,5];
x0=0;
t0=1;
p0=0;
h=0.0001;
Comparacion con la solucion analitica n=0,1,5
syms x
theta_a0 = matlabFunction(1 - x.^2/6);
theta_a1 = matlabFunction(sin(x)./x);   % cuidado: poner ./ para división elemento a elemento
theta_a5 = matlabFunction(1./sqrt(1 + x.^2/3));

Soluciones numéricas
[theta0, xi0] = lane(x0, t0, p0, 0, h);
[theta1, xi1] = lane(x0, t0, p0, 1, h);
[theta5, xi5] = lane(x0, t0, p0, 5, h);

Errores
e0 = max(abs(theta0 - theta_a0(xi0)));
e1 = max(abs(theta1 - theta_a1(xi1)));
e5 = max(abs(theta5 - theta_a5(xi5)));

disp(['Error máximo para n=0: ', num2str(e0)]);
disp(['Error máximo para n=1: ', num2str(e1)]);
disp(['Error máximo para n=5: ', num2str(e5)]);

figure;
fplot(theta_a0, [0, 10], 'LineWidth', 1.5) % <-- ahora de 0 a 2 en vez de 0 a 10
hold on

plot(xi0, theta0, '.', 'MarkerSize', 6) % <-- puntos más pequeños

xlabel('\xi')
ylabel('\theta(\xi)')
legend('Analítica n=0', 'Numérica n=0', 'Location', 'best')
title('Comparación solución analítica y numérica para n=0')
grid on
hold off
en los tres casos sale análogo

Masa

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
