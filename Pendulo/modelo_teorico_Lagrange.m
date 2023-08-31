function [t,sol] = modelo_teorico_Lagrange(carte_ini,time_interval,phi0)
% Las ecuaciones de Lagrange para el péndulo fueron calculadas
% considerando el ángulo formado con el eje x (theta)
% considerando el ángulo formado con el eje z (phi)
% Al estar en coordenadas esfericas se eligió como origen el centro
% de la esfera de radio L, el largo del pendulo
% El nivel cero de energia potencial está en el origen
    global L;
    %Coordenadas cartesianas iniciales heredadas de Newton
    x0=carte_ini(1); y0=carte_ini(2); z0=carte_ini(3);
    xp0=carte_ini(4); yp0=carte_ini(5); zp0=carte_ini(6);
    %Condiciones iniciales (theta,phi,theta_p,phi_p) [rad]
    theta_ini=0;
    phi_ini=phi0;
    theta_punto_ini=(yp0*x0-y0*xp0)/(x0^2+y0^2);
    phi_punto_ini=(x0*z0*xp0+y0*z0*yp0-x0^2*zp0-y0^2*zp0)/(L^2*sqrt(x0^2+y0^2));
    cond_ini=[theta_ini;phi_ini;theta_punto_ini;phi_punto_ini];
    %Tolerancias de error
    tol=odeset('RelTol',1e-5,'AbsTol',1e-8);
    %Resolvemos usando ode45
    tic
    [t,sol]=ode45(@sode_Lagrange,time_interval,cond_ini,tol);
    toc
end