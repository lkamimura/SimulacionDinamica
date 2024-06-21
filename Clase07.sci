function [X] = modrlc(t_etapa, xant, accion)
h=1e-9;R=2.2e3;L=10e-6;C=100e-9;
//h=1e-9;R=1;L=1;C=1;//UNITARIO
A=[-R/L, -1/L;1/C,0];B=[1/L;0];
x=xant;
u=accion;
for ii=1:t_etapa/h
  xp=A*x+B*u;
  x=x+xp*h;
  end
  X=x;
endfunction

tF=1e-3;u=0;
X=-[0; 0];ii=0;t_etapa=1e-7;
for t=0:t_etapa:tF
    ii=ii+1;
    X=modrlc(t_etapa,X,u);
    x1(ii)=X(1);x2(ii)=X(2);
    acc(ii)=u;
    u=12;
end
t=[0:t_etapa:tF]';

subplot(3,1,1);
plot(t,x1,'-');
title ( '$x_1,\ corriente$','fontsize',3);
xlabel('Tiempo [Seg.]','fontsize',2)
ylabel('$i_t$','fontsize',4,'rotation',0);
subplot(3,1,2);
plot(t,x2,'-');
title ( '$x_2 ,\ tensión\ en\ el\ capacitor$','fontsize',3);
xlabel('Tiempo [Seg.]','fontsize',2)
ylabel('$v_C$','fontsize',4,'rotation',0);
subplot(3,1,3);
plot(t,acc,'.-');
title ( "Tensión de entrada" , 'fontsize',3);
xlabel('Tiempo [Seg.]','fontsize',2)
ylabel('$v_e$','fontsize',4,'rotation',0);
