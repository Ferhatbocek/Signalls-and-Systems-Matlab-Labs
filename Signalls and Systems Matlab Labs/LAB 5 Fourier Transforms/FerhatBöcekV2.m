clc;
clear all;

Fs=60000;
f1=1000;
f2=4000;
t=0:1/Fs:0.005;
s=sin(2*pi*f1*t)+cos(2*pi*f2*t);
N=length(t);

figure(1)
plot(t,s);
title('SIGNAL s(t)');
xlabel('time');
ylabel('value of signal');
legend('s(t)');
grid on
hold on

f=linspace(-Fs/2,Fs/2,N);

figure(2)
S = abs(fftshift(fft(s,N)/N));
plot(f,S);
title('frequency response of s(t)')
xlabel('frequency');
ylabel('value');
legend('S(f)');
grid on
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Fs=100;
t1=-3:1/Fs:-1-(1/Fs);
t2=-1:1/Fs:1-(1/Fs);
t3=1:1/Fs:3;

N=1201;

x1=zeros(1,length(t1));
x2=ones(1,length(t2));
x3=zeros(1,length(t3));

t=[t1 t2 t3];
x=[x1 x2 x3];

figure(3)
plot(t,x);
title('SIGNAL x(t)')
xlabel('time');
ylabel('value');
legend('x(t)');
grid on
hold on

f=linspace(-Fs/2,Fs/2,N);

X= abs(fftshift(fft(x,N)/N));

figure(4)
plot(f,X);
title('frequency response of x(t)')
xlabel('frequency');
ylabel('value');
legend('X(f)');
grid on 
hold on
axis([-10 10 0 0.18]);

K=fft(x,N);

xc=conv(x,x);
Y=K.*K;
Y=ifft(Y,N);

figure(5)
subplot(2,1,1);
plot(xc);
grid on 
hold on
subplot(2,1,2);
plot(Y);
grid on 
hold on


























