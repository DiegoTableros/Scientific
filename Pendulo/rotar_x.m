function [r] = rotar_x(v,ang)
    global n
    m=[1,0,0;...
        0,cos(ang),-sin(ang);...
        0,sin(ang),cos(ang)];
    r=zeros(3*n,1);
    for i=1:n
        aux=m*[v(i);v(n+i);v(2*n+i)];
        r(i)=aux(1);
        r(n+i)=aux(2);
        r(2*n+i)=aux(3);
    end
    return;
end