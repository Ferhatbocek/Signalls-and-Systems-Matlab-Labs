clear all
clc
t=linspace(0,1,250);
x1t=2.3*exp(2*t);
x2t=1.2*cos(50*pi*t);
x3t=x1t+x2t;

y1t=-5*(2.3*exp(2*(t-2)))/2;
y2t=-5*(1.2*cos(50*pi*(t-2)))/2;
y3t=-5*(2.3*exp(2*(t-2))+1.2*cos(50*pi*(t-2)))/2;

figure(1);
plot(t,y1t);
hold on
plot(t,y2t);
hold on;
plot(t,y3t);

tp=t+2;

y1t=-5*(2.3*exp(2*(tp-2)))/2;
y2t=-5*(1.2*cos(50*pi*(tp-2)))/2;
y3t=-5*(2.3*exp(2*(tp-2))+1.2*cos(50*pi*(tp-2)))/2;


figure(2);
subplot(2,2,1);
plot(t,x1t);
hold on
subplot(2,2,1);
plot(t,x2t);
legend('x1 and x2');
title('signals per second');
%figure(3);
subplot(2,2,2);
plot(t,x3t);
legend('x3');
title('signals per second');
%figure(4);
subplot(2,2,3);
plot(tp,y1t);
hold on;
subplot(2,2,3);
plot(tp,y2t);
legend('y1 and y2');
title('signals per second');
%figure(5);
subplot(2,2,4);
plot(tp,y3t);
legend('y3');
title('signals per second');
figure(6);
plot(y3t,y1t+y2t);