clear
n_val=[0,1,1.5,3,5];
x0=0;
t0=1;
p0=0;
h=0.0001;
xm=10; %maximo valor de x

% Graficas theta(xi)
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

% Graficas theta(xi)^n
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

% Graficas theta(xi)^n+1
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
