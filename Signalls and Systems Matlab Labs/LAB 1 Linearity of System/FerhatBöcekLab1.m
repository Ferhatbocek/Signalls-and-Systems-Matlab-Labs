t = linspace(0,1,250);
t2 = linspace(2,3,250);
f = 250;   % 250 Hz
% t2 = linspace(0,1,1000);
% t3 = linspace(0,1,1000);
x1 = 2.3*exp(2*t);
x2 = 1.2*cos(50*pi*t);
x3 = x1 + x2;
figure(1)
subplot(2,2,1);
plot(t,x1,'r');
xlabel('time(s)')
hold on
plot(t,x2,'g')
legend('x1(t)','x2(t)');
grid on
y1 = (-5*(2.3*exp(2*(t-2))))/2;
y2 = (-5*(1.2*cos(50*pi*(t-2))))/2;
y3 = y1+y2;
subplot(2,2,2);
plot(t,x3,'black')
xlabel('time(s)')
grid on
legend('x3(t)');
subplot(2,2,3);
plot(t,y1,'b');
xlabel('time(s)')
hold on
plot(t,y2,'g')
grid on
legend('y1(t)','y2(t)');
subplot(2,2,4);
plot(t,y3,'black');
xlabel('time(s)')
grid on
legend('y3(t)');
figure(2)
plot(y1+y2,y3);
title('y3 versus y1(t)+y2(t)','Color','r');
xlabel('y1+y2');
ylabel('y3');
grid on