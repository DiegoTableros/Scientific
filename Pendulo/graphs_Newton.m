function [] = graphs_Newton(t,x,y,z,lag)
    global L;
    clf;
    z=-z;
    min_l=min(min(x),min(y)); max_l=max(max(x),max(y));
    min_z=min(z);
    masa=plot3(x(1),y(1),z(1),'m.','markersize',20); hold on;
    cuerda=plot3([0,x(1)],[0,y(1)],[0,z(1)],'k-','linewidth',1); hold on
    axis([min_l,max_l,min_l,max_l,min_z,0]); grid on; axis square;
    xlabel('x'); ylabel('y'); zlabel('-z');
    pause(2.5);
    for i=1:1000:length(t)
        delete(masa); delete(cuerda);
        masa=plot3(x(i),y(i),z(i),'m.','markersize',20,'handlevisibility','off'); hold on;
        cuerda=plot3([0,x(i)],[0,y(i)],[0,z(i)],'k-','linewidth',1,'handlevisibility','off'); hold on;
        %rastro=plot3(x(i),y(i),min_z,'b.','markersize',5,'handlevisibility','off'); hold on;
        rastro=plot3(x(i),y(i),z(i),'b.','markersize',5,'handlevisibility','off'); hold on;
        drawnow;
    end
    delete(masa); delete(cuerda); delete(rastro);
    plot3(x(1),y(1),z(1),'m.','markersize',20); hold on;
    plot3([0,x(1)],[0,y(1)],[0,z(1)],'k-','linewidth',1,'handlevisibility','off'); hold on;
    plot3(lag(:,1),lag(:,2),-lag(:,3),'r-','linewidth',0.2); hold on;
    plot3(x(1:length(t)),y(1:length(t)),z(1:length(t)),'b.','markersize',5); hold on;
    legend('[x_0,y_0,z_0]','Teórico','Discreto');
end