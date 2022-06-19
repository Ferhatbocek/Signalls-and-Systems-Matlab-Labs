clear all;
close all;
clc;

f=250;
t=0:0.001:1


x1=2*3*exp(2*t);
x2=1.2*cos(50*pi*t);
x3=x1+x2;

y1=-5*x1/2;
y2=-5*x2/2;
y3=y1+y2;

subplot(2,2,1);
plot(t,x1);
hold on 
plot(t,x2);
xlabel('Time, t') ;
ylabel('Amplitude') ;
legend('x1','x2')



subplot(2,2,2);
plot(t,x3);
xlabel('Time, t') ;
ylabel('Amplitude') ;
legend('x3')

subplot(2,2,3);
t2=2:0.001:3;
plot(t2,y1);
hold on
plot(t2,y2);
xlabel('Time, t') ;
ylabel('Amplitude') ;
legend('y1','y2')
subplot(2,2,4);
t2=2:0.001:3;
plot(t2,y3);
xlabel('Time, t') ;
ylabel('Amplitude') ;
legend('y3')

figure
plot(y3,y1+y2)
















