
function [xi, theta, phi] = lane_emden_euler(n)
    % Parámetros
    h = 0.0001;
    max_xi = 10;

    % Inicialización
    xi(1) = h;       % Comenzamos en un valor pequeño para evitar la singularidad en xi = 0
    theta(1) = 1;    % Taylor a primer orden alrededor de xi=0
    phi(1) = 0;      % dθ/dξ(0) = 0

    i = 1;
    while theta(i) > 0 && xi(i) <= max_xi
        % Método de Euler
        xi(i+1) = xi(i) + h;
        theta(i+1) = theta(i) + h * phi(i);
        phi(i+1) = phi(i) - h * (theta(i)^n + (2/xi(i)) * phi(i));
        i = i + 1;
    end

    % Añadir punto final donde theta se hace 0 por interpolación lineal (opcional)
end