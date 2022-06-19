clc;close all;clear all;

%9.1 and 9.2

f1=50;

f2=200;

f3=500;

Fs=5000;

t=linspace(-0.05,0.05,1000);

x=(0.1*sin(2*pi*f1*t))+(0.5*cos(2*pi*f2*t))-(0.9*sin(2*pi*f3*t));

N=length(x);

figure;

subplot(211)

plot(t,x);grid;xlabel('t(s)')

title('x(t) in time domain')

f=-Fs/2:Fs/N:(Fs/2)-(Fs/N);

subplot(212)

plot(f,abs(fftshift(fft(x))))

grid;xlabel('f(Hz)')

ylabel('x(t)')

ylabel('|X(f)|')

title('Frequency spectrum')



%9.3 ,4,5,6

figure;

subplot(311)

for n=1:7

fc=75;

wc=2*fc/Fs;

[b a]=butter(n,wc);

[H f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

ylpf=filter(b,a,x);

xlabel('f(Hz)');grid;

ylabel('|H(f)|')

title('Frequency response of LPF')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7')

subplot(312)

for n=1:7

fc=350;

wc=2*fc/Fs;

[b a]=butter(n,wc,'high');

[H f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

yhpf=filter(b,a,x);

xlabel('f(Hz)');grid;

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7')

ylabel('|H(f)|')

title('Frequency response of HPF')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7')

subplot(313)

for n=1:7

fc=[75 350];

wc=2*fc/Fs;

[b a]=butter(n,wc,'bandpass');

[H f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

ybpf=filter(b,a,x);

xlabel('f(Hz)');grid;

ylabel('|H(f)|')

title('Frequency response of BPF')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7')



%.9.7 and 9.8

figure;

f=-Fs/2:Fs/N:(Fs/2)-(Fs/N);

subplot(411)

plot(f,abs(fftshift(fft(x))))

grid;xlabel('f(Hz)')

ylabel('|X(f)|')

title('Frequency response of X(f)')

subplot(412)

plot(f,abs(fftshift(fft(ylpf))))

grid;xlabel('f(Hz)')

ylabel('|Ylpf|')

title('Frequency response of ylpf')

subplot(413)

plot(f,abs(fftshift(fft(yhpf))))

grid;xlabel('f(Hz)')

ylabel('|YHpf|')

title('Frequency response of yhpf')

subplot(414)

plot(f,abs(fftshift(fft(ybpf))))

grid;xlabel('f(Hz)')

ylabel('|YBpf|')

title('Frequency response of ybpf')