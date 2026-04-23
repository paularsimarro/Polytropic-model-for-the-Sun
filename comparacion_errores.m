n_val=[0,1,1.5,3,5];
x0=0;
t0=1;
p0=0;
h=0.0001;

% Comparacion con la solucion analitica n=0,1,5
syms x
theta_a0 = matlabFunction(1 - x.^2/6);
theta_a1 = matlabFunction(sin(x)./x);   % cuidado: poner ./ para división elemento a elemento
theta_a5 = matlabFunction(1./sqrt(1 + x.^2/3));

Soluciones numéricas
[theta0, xi0] = lane(x0, t0, p0, 0, h);
[theta1, xi1] = lane(x0, t0, p0, 1, h);
[theta5, xi5] = lane(x0, t0, p0, 5, h);

% Errores
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