function [res] = condIni()
    global n l k g m M
    %Esta función retorna la condición inicial de equilibrio
    %del sistema de masa resorte
    
    %Lado izquierdo
    A=zeros(n,n);
    A(1,1)=2; A(1,2)=-1;
    for j=2:n-1
        A(j,j)=2; A(j,j-1)=-1; A(j,j+1)=-1;
    end
    A(n,n-1)=-1; A(n,n)=1;
    %Lado derecho
    B=(m*g/k)*ones(n,1);
    B(n)=(M*g/k)+l;
    %Retornamos las z de equilibrio
    z=mldivide(A,B);
    res=[zeros(2*n,1);z];
    return;
end

