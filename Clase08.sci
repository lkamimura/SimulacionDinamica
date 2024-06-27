// Parametros
//w=0.2;a=0.01;b=2;c=100;dt=1e-3;tf=5;
w=0.2;a=0.01;b=2;c=50;dt=1e-3;tf=20;

//Entrada
u = 1;

// Inicializacion
ii = 0;
x = [0; 0; 0; 0];
wc = w^2;

// Espacio de Estados
A = [-a  a  0  0;
     0   0  1  0;
     wc -wc  0  0;
     c   0  0  0];
B = [0; 0; wc*b; 0];

// Simulacion
t = 0:dt:tf;
xout = x;  

for i = 1:length(t)
  xp = A*x + B*u;
  x = x + xp*dt;
  xout(:,i) = x;
end

// Estados
x1 = xout(1,:);
x2 = xout(2,:);
x3 = xout(3,:);
x4 = xout(4,:);


// Graficos
subplot(2,1,1);
plot(t, x2, 'linewidth', 2);
title ( 'Problema del avion Scilab','fontsize',3);
xlabel('t [s]','fontsize',2)
ylabel('$Φ [rad]$','fontsize',4,'rotation',90);

subplot(2,1,2);
plot(t, x4, 'linewidth', 2);
xlabel('t [s]','fontsize',2)
ylabel('$altura [m]$','fontsize',4,'rotation',90);
