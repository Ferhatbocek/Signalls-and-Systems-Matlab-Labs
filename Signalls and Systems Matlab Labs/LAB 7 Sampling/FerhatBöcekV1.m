% 260206055 Yiğit Öksüz
clc;close all;clear all;
%% 10.1
%a
duration = 0.0020;
f = 2000;
Fs = 1000.*f;
t = 0:1/Fs:duration;
x = sin(2*pi.*t.*f);
%b
t1 = 0:1/25000:duration;
t2 = 0:1/10000:duration;
x1 = sin(2*pi.*t1.*f);
x2 = sin(2*pi.*t2.*f);
%c
subplot(311);plot(t,x);title('x(t)');xlabel('(s)');
subplot(312);stem(t1,x1,'r');title('x1[n]');xlabel('[n]');
subplot(313);stem(t2,x2,'k');title('x2[n]');xlabel('[n]');
%d
x25=interp1(t1,x1,t);
x10=interp1(t2,x2,t);
%e
figure
subplot(311);plot(t,x);title('x(t)');xlabel('(s)');
subplot(312);plot(t,x25,'r');title('x1[n] with interpolite');
subplot(313);plot(t,x10,'k');title('x2[n] with interpolite');
%% 10.1.1
%f
freq_response_x = fft(x,4001);
xf = linspace(-Fs/2,Fs/2,4001);
freq_response_x1 = fft(x25,4001);
x1f = linspace(-25000/2,25000/2,4001);
freq_response_x2 = fft(x10,4001);
x2f = linspace(-10000/2,10000/2,4001);
%g
figure
n1 = fftshift(abs(freq_response_x))/4001;
n2 = fftshift(abs(freq_response_x1))/4001;
n3 = fftshift(abs(freq_response_x2))/4001;
subplot(311);plot(xf,n1);title('X(f)');ylabel('|X(f)|');xlabel('frequency(Hz)');
xlim([-5000 5000]);
subplot(312);plot(x1f,n2,'r');title('X1(f)');ylabel('|X1(f)|');xlabel('frequency(Hz)');
xlim([-5000 5000]);
subplot(313);plot(x2f,n3,'k');title('X2(f)');ylabel('|X2(f)|');xlabel('frequency(Hz)');
xlim([-5000 5000]);
%% 10.2
%a
xd1 = downsample(x1,5);
t1d = downsample(t1,5);
xd2 = downsample(x2,2);
t2d = downsample(t2,2);
%b
figure
subplot(211);stem(t1d,xd1);title('x1[n] downsampled');
subplot(212);stem(t2d,xd2);title('x2[n] downsampled');

