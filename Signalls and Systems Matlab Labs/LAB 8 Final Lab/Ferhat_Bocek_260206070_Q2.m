clc;
clear all;
close all;


Fs=5000;
d=0.5;
t=-d:1/Fs:d;
x=3*cos(2*pi*50*t)+0.8*sin(2*pi*250*t)+cos(2*pi*900*t)+3*sin(2*pi*2200*t);

plot(t,x);
grid on;
xlabel('time(sec)')
ylabel('Amplitude')
title('x(t) signal')
legend('x(t)')

%%%%%%%%%  BPF   %%%%%%%%

figure
subplot(311)
plot(t,x);
grid on;
xlabel('time(sec)')
ylabel('Amplitude')
title('x(t) signal')
legend('x(t)')


subplot(312)
for n=1:10

fc=[250 900];

wc=2*fc/Fs;

[b, a]=butter(n,wc,'bandpass');

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;


end

ybpf=filter(b,a,x);

xlabel('f(Hz)');grid;

ylabel('|H(f)|')

title('Frequency response of BPF')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10')

%%%%% Hpf and Lpf at same signal component of x(t) %%%%%%

subplot(313)
for n=1:10

fc=900;

wc=2*fc/Fs;

[b, a]=butter(n,wc);

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

ylpf=filter(b,a,x);

xlabel('f(Hz)');grid;

ylabel('|H(f)|')

title('Frequency response of LPF')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10')



for n=1:10

fc=250;

wc=2*fc/Fs;

[b, a]=butter(n,wc,'high');

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

yhpf=filter(b,a,x);

xlabel('f(Hz)');grid;

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10')

ylabel('|H(f)|')

title('Frequency response of HPF and LPF At The Same Signal')


%%%%%% part e %%%%%%

figure 
subplot(211)

for n=1:10

fc=[250 900];

wc=2*fc/Fs;

[b, a]=butter(n,wc,'bandpass');

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));
hold on;
plot(t,x);
end

ybpf=filter(b,a,x);

xlabel('f(Hz)');grid;

ylabel('|H(f)|')

title('Frequency response of BPF at the x(t) signal')

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10')

%%%%% part f %%%%%%

subplot(212)

hold on;
plot(t,x);

for n=1:10

fc=900;

wc=2*fc/Fs;

[b, a]=butter(n,wc);

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

ylpf=filter(b,a,x);


for n=1:10

fc=250;

wc=2*fc/Fs;

[b, a]=butter(n,wc,'high');

[H, f]=freqz(b,a,1024,Fs);

plot(f,abs(H));hold on;

end

yhpf=filter(b,a,x);

xlabel('f(Hz)');grid;

legend('n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10')

ylabel('|H(f)|')

title('Frequency response of HPF and LPF at the x(t) signal  ')










