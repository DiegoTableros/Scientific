function [sistema] = sode_Newton(t,s)
%Función que evalúa el lado derecho de las 6n ODE del sistema
%de masas y resortes
    
    global n g k l m
    global M
    %PERDIDA DE MASA (EXPERIMENTAL)
%     if (t<=2.5); M=0.1-((0.1-m)/2.5)*t; else; M=m; end
    
    %"y" es un vector de 6n variables en el siguiente orden
    % x1,...,xn son s(1),...,s(n)
    % y1,...,yn son s(n+1),...,s(2n)
    % z1,...,zn son s(2n+1),...,s(3n)
    % vx1,...,vxn son s(3n+1),...,s(4n)
    % vy1,...,vyn son s(4n+1),...,s(5n)
    % vz1,...,vzn son s(5n+1),...,s(6n)
    x=s(1:n); y=s(n+1:2*n); z=s(2*n+1:3*n);
    vx=s(3*n+1:4*n); vy=s(4*n+1:5*n); vz=s(5*n+1:6*n);
    
    %Distancias
    d=zeros(n,1);
    d(1)=sqrt((x(1))^2+(y(1))^2+(z(1))^2);
    for j=2:n
        d(j)=sqrt((x(j)-x(j-1))^2+(y(j)-y(j-1))^2+(z(j)-z(j-1))^2);
    end
    
    %Construimos el SODE para devolver
    sistema=zeros(6*n,1);
    %EDOs para X,Y,Z
    for j=1:n
        sistema(j)=vx(j);
        sistema(n+j)=vy(j);
        sistema(2*n+j)=vz(j);
    end
    %EDOs para Vx
    sistema(3*n+1)=((k/m)*(d(2)-l)/d(2))*(x(2)-x(1))-((k/m)*(d(1)-l)/d(1))*(x(1));
    for j=2:n-1
        i=3*n+j;
        sistema(i)=((k/m)*(d(j+1)-l)/d(j+1))*(x(j+1)-x(j))-((k/m)*(d(j)-l)/d(j))*(x(j)-x(j-1));
    end
    sistema(4*n)=-((k/M)*(d(n)-l)/d(n))*(x(n)-x(n-1));
    %EDOs para Vy
    sistema(4*n+1)=((k/m)*(d(2)-l)/d(2))*(y(2)-y(1))-((k/m)*(d(1)-l)/d(1))*(y(1));
    for j=2:n-1
        i=4*n+j;
        sistema(i)=((k/m)*(d(j+1)-l)/d(j+1))*(y(j+1)-y(j))-((k/m)*(d(j)-l)/d(j))*(y(j)-y(j-1));
    end
    sistema(5*n)=-((k/M)*(d(n)-l)/d(n))*(y(n)-y(n-1));
    %EDOs para Vz
    sistema(5*n+1)=((k/m)*(d(2)-l)/d(2))*(z(2)-z(1))-((k/m)*(d(1)-l)/d(1))*(z(1))+g;
    for j=2:n-1
        i=5*n+j;
        sistema(i)=((k/m)*(d(j+1)-l)/d(j+1))*(z(j+1)-z(j))-((k/m)*(d(j)-l)/d(j))*(z(j)-z(j-1))+g;
    end
    sistema(6*n)=-((k/M)*(d(n)-l)/d(n))*(z(n)-z(n-1))+g;
    return;
end