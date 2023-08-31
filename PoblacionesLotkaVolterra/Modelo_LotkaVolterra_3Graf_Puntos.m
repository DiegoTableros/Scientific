%Programa MATLAB para dibujar el espacio fase para el modelo Lotka-Volterra
%Los resultados son mostrados en cada tiempo (por pasos).
%Se grafican las series de Presa y Depredador contra Tiempo.
%Se pueden cambiar los parametros Alpha, Beta, Gamma, Delta a conveniencia.
%Las ecuaciones se resuelven usando "ode45", un solucionador numerico de
%ecuaciones diferenciales ordinarias.
%Adaptado de la versión hecha por James Adams 03/04/14, disponible en
%https://la.mathworks.com/matlabcentral/fileexchange/46128-lotka-volterra-predator-prey-model
% =========================================================================

function LotkaVolterra_JA
clear  % Limpiar la ventana de comandos
clc    % Limpiar el historial de comandos
clf    % Limpia la ventana de figure para la simulacion
% =============== Ajustes parametricos ==================================== 
cuenta = 3;  % Es la cuenta regresiva para empezar la simulacion 
iteraciones = 1;  % Poner las iteraciones iniciales en 1
pausetime = 0.1;  % Shows solutions at each time step
duracion = 22;    % Duracion de la simulacion
% ================ Parametros de la ecuacion ==============================
alpha = 0.4;
beta = 0.8;
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
    subplot(3,1,1)
    plot(sol(iteraciones,1),sol(iteraciones,2),'.','color',[rand; rand; rand],'markersize',10,'MarkerFaceColor','b');                               
    hold on
    title(['Modelo Lotka-Volterra       a = ' num2str(t(iteraciones)) ' años'],'fontsize',12)
    xlabel('Conejos [miles]','fontsize',10)
    ylabel('Linces [miles]','fontsize',10)
    axis([min(sol(:,1)) max(sol(:,1)) min(sol(:,2)) max(sol(:,2))])
    
    subplot(3,1,2)
    text(0.1,0.5,'La serie se mostrará al finalizar la simulación')
    
    subplot(3,1,3)
    text(0.1,0.5,'La serie se mostrará al finalizar la simulación')
    
    iteraciones = iteraciones + 1;   % Adds 1 to the iteration count. 
    pause(pausetime)
end
% === Se grafica la serie Presa y Depredador ==== 
    subplot(3,1,2)
    plot(t(:,1),sol(:,1),'b.','markersize',10,'MarkerFaceColor','b')
    title(['Linces en función del tiempo'],'fontsize',10)
    xlabel('Tiempo [años]')
    ylabel('Conejos [miles]')
    axis([min(t(:,1)) max(t(:,1)) min(sol(:,1)) max(sol(:,1))])
    legend('Linces')
    
    subplot(3,1,3)
    plot(t(:,1),sol(:,2),'r.','markersize',10,'MarkerFaceColor','r')
    title(['Conejos en función del tiempo'],'fontsize',10)
    xlabel('Tiempo [años]')
    ylabel('Linces [miles]')
    axis([min(t(:,1)) max(t(:,1)) min(sol(:,2)) max(sol(:,2))])
    legend('Conejos')
end
%====================== Fin de simulacion =================================