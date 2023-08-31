function sistema = sode_Lagrange(t,y)
% Función que devuelve el sistema de ecuaciones Lagrangiano
    % d/dt[theta] = theta_p
    % d/dt[phi] = phi_p
    % d/dt[theta_p] = -2*cos(phi)/sin(phi)*theta_p*phi_p
    % d/dt[phi_p] = theta_p^2*sin(phi)*cos(phi)-(g/L)*sin(phi)
    %Tenemos y(1)=theta, y(2)=phi, y(3)=theta_p, y(4)=phi_p
    global L g
    sistema=zeros(4,1);
    sistema(1)=y(3);
    sistema(2)=y(4);
    sistema(3)=-2*(cos(y(2))/sin(y(2)))*y(3)*y(4);
    sistema(4)=y(3)^2*sin(y(2))*cos(y(2))-(g/L)*sin(y(2));
    return;
end