%Programa MATLAB para dibujar el espacio fase para el modelo Lotka-Volterra
%Los resultados son mostrados en cada tiempo (por pasos).
%Se grafican las series de Presa y Depredador contra Tiempo.
%Se pueden cambiar los parametros Alpha, Beta, Gamma, Delta a conveniencia.
%Las ecuaciones se resuelven usando "ode45", un solucionador numerico de
%ecuaciones diferenciales ordinarias.
%Adaptado de la versión hecha por James Adams 03/04/14, disponible en
%https://la.mathworks.com/matlabcentral/fileexchange/46128-lotka-volterra-predator-prey-model

function LotkaVolterra_JA
clear  % Limpiar la ventana de comandos
clc    % Limpiar el historial de comandos
clf    % Limpia la ventana de figure para la simulacion

% =============== Ajustes parametricos ==================================== 
cuenta = 3;  % Es la cuenta regresiva para empezar la simulacion 
iteraciones = 1;  % Poner las iteraciones iniciales en 1
pausetime = 0.1;  % Shows solutions at each time step
duracion = 20;    % Duracion de la simulacion

% ================ Parametros de la ecuacion ==============================
alpha = 0.397;
beta = 0.786;
gamma = 0.018;
delta = 0.023;

% =============== Condiciones iniciales para X e Y ========================
poblacion_presa_inicial = 30;
poblacion_depredador_inicial = 4;
fprintf('Modelo de Lotka-Volterra')
fprintf('\n\nLos parámetros introducidos son,')
fprintf('\n\nalpha = %2.6f \nbeta = %2.6f \ngamma = %2.6f \ndelta = %2.6f ',alpha,beta,gamma,delta)
fprintf('\nLa simulación empezará en ')

for i = cuenta:-1:1
    fprintf('\n%8i',cuenta')    % Countdown to simulation start.
    cuenta = cuenta-1;
    pause(1)
end

% Resolucion de ecuaciones usando ode45 (nonstiff runge kutta)
deq1=@(t,x) [x(1)*(alpha - gamma*x(2)); -x(2)*(beta-delta*x(1))];
[t,sol] = ode45(deq1,[0 duracion],[poblacion_presa_inicial poblacion_depredador_inicial]);
arraysize = size(t);  % Sets time array size for the for loop.

%======= Las soluciones son graficadas para cada paso de tiempo ===========
for i = 1 : max(arraysize)
    %subplot(2,1,1)
    subplot(1,1,1)
    %plot(sol(iteraciones,1),sol(iteraciones,2),'.','markeredgecolor','b','markersize',16);                               
    hold on
    %title(['Modelo Lotka-Volterra       a ' num2str(t(iteraciones)) ' años'],'fontsize',16)
    xlabel('Poblacion de liebres [miles]','fontsize',14)
    ylabel('Poblacion de linces [miles]','fontsize',14)
    axis([min(sol(:,1)) max(sol(:,1)) min(sol(:,2)) max(sol(:,2))])
    
    %subplot(2,1,2)
    %text(1,1,'La serie se mostrará al finalizar la simulación')
    
    iteraciones = iteraciones + 1;   % Agrega 1 al contador de iteraciones 
    pause(pausetime)
end
    
    % === Se grafica la serie Presa y Depredador ====
    subplot(1,1,1)
    Conejos=[30 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22 25.4 27.1 40.3 57 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7]
    Linces=[4 6.1 9.8 35.2 59.4 41.7 19 13 8.3 9.1 7.4 8 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6]
    Tiempo=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]
    plot(t(:,1),sol(:,1),t(:,1),sol(:,2),'LineWidth',2)
    plot(Tiempo, Conejos,'-o','markeredgecolor','b','markerfacecolor','b','markersize',3)
    plot(Tiempo, Linces,'-o','markeredgecolor','r','markerfacecolor','r','markersize',3)
    %title(['Liebres y Linces en función del tiempo'],'fontsize',16)
    xlabel('Tiempo [años]','fontsize',15)
    ylabel('Población [miles]','fontsize',15)
    %axis([min(t(:,1)) max(t(:,1)) min(sol(:,2)) max(sol(:,1))])
    axis([0 20 0 90])
    legend('Solución liebres','Solución linces','Liebres','Linces')
end
%====================== Fin de simulacion =================================