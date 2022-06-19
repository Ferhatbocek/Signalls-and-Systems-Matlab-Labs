clc;
close all;
clear all;
dt=0.001;
t1=0:dt:5;
dtt1=dt:dt:5+dt
t2=5+dt:dt:10;
dtt2=5+dt+dt:dt:10+dt
t3=[t1 t2];
dtt3=[dtt1 dtt2]
f=0.2;
x1=-exp(-t1);
x1_derivative=-exp(-dtt1);
x2=-sin(2*pi*f*t2+6*dt);
x2_derivative=-sin(2*pi*f*dtt2+6*dt);
x = [x1 x2];
dx= [x1_derivative x2_derivative]
x_cal = [1 zeros(1,10000)];

for t = 2:length(t3)
    x_cal(t) = (dx(t)-x(t))/(0.0001);
end
plot(t3,x,'-r')
hold on
plot(dtt3,x_cal,'-k')
legend('x(t)','x_cal(t)')
ak=[zeros(1,10001)];
%{
for k=-3000:1:3000
    
end
%}




