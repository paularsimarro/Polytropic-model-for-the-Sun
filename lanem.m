function [theta,xi,M]=lanem(x0,t0,p0,n,h) %condiciones iniciales (0,1,0,n,0.0001)
%inicializamos 
theta = [];
xi = [];
phi = [];
xi(1)=x0; 
theta(1)=t0; 
phi(1)=p0; 
phi(2)=t0-h*(p0^n); %estimación inicial para no dividir por 0
i=1;
while theta(i)>0 && xi(i)<=10 %condicion de parada 
    theta(i+1)=theta(i)+h*phi(i);
    xi(i+1)=x0+h*i;
    phi(i+2)=phi(i+1)-h*(theta(i+1)^n+2*phi(i+1)/xi(i+1));
    i=i+1;
end
t=length(xi);
xiend = xi(t);
M = zeros(1, t);
for j = 1:t
        M(j) =(xi(j)/ xiend)^2*(phi(j) / phi(t));% para evitar división por cero
end
end