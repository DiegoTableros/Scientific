global L g M n k l m
clc;

%Parametros para simulaciones (unidades MKS)
L=1.5; g=9.81; M=0.1;
n=32; k=10000; l=L/n; m=0.0001;
time_interval=[0;25];
phi0=pi/3;

%MODELO DISCRETO
[t_N,sol_N,L_ini]=modelo_numerico_Newton(time_interval,phi0);
%Procesamiento de soluciones
x_N=sol_N(:,n);
y_N=sol_N(:,2*n);
z_N=sol_N(:,3*n);

%MODELO TEÓRICO
L=L_ini;
carte_ini=[sol_N(1,n:n:6*n)];
[t_L,sol_L]=modelo_teorico_Lagrange(carte_ini,time_interval,phi0);
%Procesamiento de soluciones
phi=sol_L(:,2);
theta=sol_L(:,1);
x_L=L.*sin(phi).*cos(theta);
y_L=L.*sin(phi).*sin(theta);
z_L=L.*cos(phi);

%EXPERIMENTAL
% [t_E,x_E,y_E]=Experimento3;
% tam_t_E=length(t_E);

figure(1);
graphs_Newton(t_N,x_N,y_N,z_N,[x_L,y_L,z_L]);
figure(2);
plot(x_L,-z_L,'r-','linewidth',0.5); hold on;
plot(x_N,-z_N,'b-','linewidth',0.5); hold on;
plot(x_N(1),-z_N(1),'m.','markersize',20);
grid on; xlabel('x [m]'); ylabel('-z [m]');
legend('Teórico','Discreto','[x_0,z_0]'); axis square;
axis([min(-z_N),-min(-z_N),min(-z_N),0]);
figure(3);
plot(t_L,-z_L,'r-','linewidth',0.5); hold on;
plot(t_N,-z_N,'b-','linewidth',0.5); hold on;
grid on; xlabel('t [s]'); ylabel('-z [m]');
legend('Teórico','Discreto'); axis square;
figure(4);
plot(x_L,y_L,'r-','linewidth',0.5); hold on;
plot(x_N,y_N,'b-','linewidth',0.5); hold on;
plot(x_N(1),y_N(1),'m.','markersize',20);
grid on; xlabel('x [m]'); ylabel('y [m]');
legend('Teórico','Discreto','[x_0,y_0]'); axis square;