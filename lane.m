function [theta,xi]=lane(x0,t0,p0,n,h) %condiciones iniciales (0,1,0,n,0.0001)
%inicializamos 
% theta = [];
% xi = [];
% phi = [];
xi(1)=x0; 
theta(1)=t0; 
phi(1)=p0; 
i=1;
while theta(i)>=0 && xi(i)<=10 %condicion de parada 
    xi(i+1)=xi(i)+h;
    theta(i+1)=theta(i)+h*phi(i);
    if xi(i)==0
    phi(i+1)=phi(i)-h*theta(i)^n;
    else
    phi(i+1)=phi(i)-h*(theta(i)^n+2*phi(i)/xi(i));
    end
    i=i+1;
end
