function [t,sol,L_ini] = modelo_numerico_Newton(time_interval,phi0)
%Sistema de n masas resortes acopladas para simular péndulo
%Utilizando n masas y n resortes se simula una cadena,
%poniendo una masa grande inferior se simula un péndulo
%Las coordenadas son cartesianas (x,y,z)
%Se admiten condiciones iniciales de posición y velocidad
    global n l
    %Condición inicial de equilibrio [x0,y0,z0]
    cond_ini=condIni; L_ini=cond_ini(3*n);
    %Rotación (usar funciones rotar_y, rotar_x)
    cond_ini=[rotar_y(cond_ini,phi0);zeros(3*n,1)];
    %Velocidades iniciales para la masa M (4n->vx, 5n->vy, 6n->vz)
    cond_ini(4*n)=-0.7;
    cond_ini(5*n)=0.8;
    
    %Solución del sistema usando ode15s
    tic
    [t,sol]=ode15s(@sode_Newton,time_interval,cond_ini);
    toc
end