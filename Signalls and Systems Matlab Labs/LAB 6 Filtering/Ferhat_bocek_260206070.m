clc;
clear;


Fs=5000;
t = -0.05: 1/Fs : 0.05;

f1 = 50;
f2 = 200;
f3 = 500;

h = (t == 0);

x = 0.1 * sin(2*pi*f1*t)+0.5 * cos(2*pi*f2*t)+(-0.9 * sin(2*pi*f3*t));


figure(1);
plot(t,x);
title('x(t)');
xlabel('Time(sec)');


x1 = conv(x, h)
N = length(x);
x1fft = fft(x1,N);
x1fft = fftshift(x1fft);
x1fft = abs(x1fft)/N;

figure(2);
f = Fs * linspace(-0.5, 0.5, N);
plot(f, x1fft);
title('x1(f)');
xlabel('Frequency');

%% My low-pass Filter
Fo1 = 75;
n = 7;
[blp, alp] = butter(n, Fo1 / (Fs / 2), 'low');

%% My high-pass Filter with cut-off frequency Fc
Fo2 = 350;
[bhp, ahp] = butter(n , Fo2 / (Fs / 2), 'high');

%% My band-pass filter
Fc = [Fo1 Fo2];
[bbp, abp] = butter(n, Fc ./ (Fs / 2), 'bandpass');

[Hlp, Flp]=freqz(blp, alp, Fs/2);
[Hhp, Fhp]=freqz(bhp, ahp, Fs/2);
[Hbp, Fbp]=freqz(bbp, abp, Fs/2);

figure(3);

subplot(411);
plot(x1);
title('x1(f) Frequency');
xlabel('Frequency');

subplot(412);
plot(Flp,abs(Hlp));
title('Frequency response of low-pass');
xlabel('Frequency');

subplot(413);
plot(abs(Hhp));
title('Frequency response of high-pass');
xlabel('Frequency');

subplot(414);
plot(abs(Hbp));
title('Frequency response of band-pass');
xlabel('Frequency');

