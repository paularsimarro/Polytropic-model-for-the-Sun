% Datos :
Tc = 1.57e7 ;
rho_c = 76 ;
xi_1 = 6.8968; %primer cero de la funci ´o n de Lane para n =3
M_sun = 1.989e33 ;
R_sun = 6.96e10 ;
alpha = R_sun / xi_1 ;
x0 = 0;
t0 = 1;
p0 = 0;
h = 0.0001;
n = 3;
[ theta , xi , phi ] = lane ( x0 , t0 , p0 , n , h ) ;
phi = phi (1: length ( xi ) ) ;
r_R = xi / xi_1 ; %normalizamos el radio
% Perfiles :
T = Tc * theta ;
rho = rho_c * theta .^3;
M = -4 * pi * alpha ^3 * rho_c .* xi .^2 .* phi ;
% Normalizamos la masa para graficar :
M_norm = M / M_sun ;
% % Gr ´a fica Temperatura
figure
plot ( r_R , T , ' Color ' , [0.85 0.33 0.65] , ' LineWidth ' , 2.5)
xlabel ( 'r / R_ \ odot ' , ' FontSize ' , 14)
ylabel ( ' Temperatura ( K ) ' , ' FontSize ' , 14)
title ( ' Perfil de Temperatura ' , ' FontSize ' , 16)
grid on
set ( gca , ' FontSize ' , 12)
% % Gr ´a fica Densidad
figure
plot ( r_R , rho , ' Color ' , [0.58 0.44 0.86] , ' LineWidth ' , 2.5)
xlabel ( 'r / R_ \ odot ' , ' FontSize ' , 14)
ylabel ( ' Densidad ( g / cm ^3) ' , ' FontSize ' , 14)
title ( ' Perfil de Densidad ' , ' FontSize ' , 16)
grid on
set ( gca , ' FontSize ' , 12)
% % Gr ´a fica Masa :
figure
plot ( r_R , M_norm , ' Color ' , [0.69 0.29 0.62] , ' LineWidth ' , 2.5)
xlabel ( 'r / R_S ' , ' FontSize ' , 14)
ylabel ( ' Masa ( M_S ) ' , ' FontSize ' , 14)
title ( ' Perfil de Masa ' , ' FontSize ' , 16)
grid on
set ( gca , ' FontSize ' , 12)
