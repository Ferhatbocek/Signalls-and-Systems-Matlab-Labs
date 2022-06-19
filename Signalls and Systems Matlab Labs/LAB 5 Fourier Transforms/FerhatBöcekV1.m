clc;
clear all;
close all;
%% Part 1
% %%%part 1
% Fs = 60*10^3;
% f1 = 1000;
% f2 = 4000;
% t = 0:1/Fs:5*10^(-3);
% s = sin(2*pi*f1*t)+cos(2*pi*f2*t);
% plot(t,s,'-r');xlabel('time');ylabel('s(t)');title('s(t) respect to time');
% figure;
% f = linspace(-Fs/2,Fs/2,length(s));
% S = fft(s);
% plot(f,fftshift(abs(S)),'-k');xlabel('f');ylabel('S(f)');title('Fourier transform of s(t)');
% %%%part 2
%%
%%Part2
Fs = 100;
t = -3:1/Fs:3;
x = [zeros(1,200) ones(1,200) zeros(1,201) ];
plot(t,x,'-r');xlabel('t');ylabel('x(t)');title('x(t) respect to time');
figure;
f = linspace(-Fs/2,Fs/2,1201);
X = fft(x,1201);
plot(f,fftshift(abs(X)),'-k');xlabel('f');ylabel('X(f)');title('X(f) respect to frequency');
axis([-10 10 0 250]);
figure;

Xc = conv(x,x);
Y = X.*X;
y = ifft(Y,1201);
subplot(211);plot(Xc);xlabel('f');ylabel('xc');title('Conv of x(t)');
legend('xc');
subplot(212);plot(y);xlabel('f');ylabel('y(t)');title('Inverse Fourier');
axis([0 1400 0 200]);
legend('y(t)');
