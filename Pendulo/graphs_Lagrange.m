function [] = graphs_Lagrange(t,sol)
% Esta función recibe las soluciones teoricas del pendulo y ofrece
% distintas opciones para graficar según se requiera

    global L M g
%Conversión a coordenadas cartesianas
    theta=sol(:,1); phi=sol(:,2); theta_p=sol(:,3); phi_p=sol(:,4);
    x=L.*sin(phi).*cos(theta);
    y=L.*sin(phi).*sin(theta);
    z=L.*cos(phi); z=-z;
    
%Graficación de trayectorias 3D y 2D
    for i=1:length(t)
        g1=subplot(1,3,1);
            plot3([0,x(i)],[0,y(i)],[0,z(i)]); hold on;
            plot3(x(i),y(i),z(i),'k.','markersize',10);
            axis([-L,L,-L,L,-L,0]); grid on; axis square;
            xlabel('x'); ylabel('y'); zlabel('z (invertido)');
        g2=subplot(1,3,2);
            plot(x(i),y(i),'b.','markersize',8); hold on;
            axis([-L,L,-L,L]); grid on; axis square;
            xlabel('x'); ylabel('y');
        g3=subplot(1,3,3);
            e_k=(M/2)*((L*theta_p(i)*sin(phi(i)))^2+(L*phi_p(i))^2);
            e_v=(M*g*L)*(1-cos(phi(i)));
            energia=e_k+e_v;
            plot(t(i),energia,'r.','markersize',9); hold on;
            grid on; axis square;
            xlabel('Tiempo'); ylabel('Energia');
        pause(0.01);
        cla(g1);
    end
end