clc

f = 2000;
T = 1/f;
d = 4*T;
Fs = 1000*f;
t = 0:1/Fs:d;

fs1 = 25000;
fs2 = 10000;

t1 = 0:1/fs1:d;
t2 = 0:1/fs2:d;

x = sin(2*pi*f*t);

x1 = sin(2*pi*f.*t1);
x2 = sin(2*pi*f.*t2);

subplot(3,1,1);
plot(t,x)
title('x(t)');
xlabel('t');
ylabel('x(t)');
subplot(3,1,2);
stem(t1,x1)
title('sampled at 25 kHz x(t)');
xlabel('n');
ylabel('x1[n]');
subplot(3,1,3);
stem(t2,x2)
title('sampled at 10 kHz x(t)');
xlabel('n');
ylabel('x2[n]');

intx1 = interp1(t1,x1,t,'linear');
intx2 = interp1(t2,x2,t,'linear');

figure
subplot(3,1,1);
plot(t,x)
title('x(t)');
xlabel('t');
ylabel('x(t)');
subplot(3,1,2);
plot(t,intx1)
title('interpolation of x1[n]');
xlabel('t');
ylabel('x1(t)');
subplot(3,1,3);
plot(t,intx2)
title('interpolation of x2[n]');
xlabel('t');
ylabel('x2(t)');

X = fft(x);
X1 = fft(x1);
X2 = fft(x2);
XX = fftshift(X);
XX1 = fftshift(X1);
XX2 = fftshift(X2);

f1 = linspace(-Fs/2,Fs/2,length(x));
f2 = linspace(-fs1/2,fs1/2,length(x1));
f3 = linspace(-fs2/2,fs2/2,length(x2));

figure
subplot(3,1,1)
plot(f1,abs(XX)/length(x))
xlim([-5000 5000]);
title('Frequency response of x(t)');
xlabel('frequency');
ylabel('X(f)');
subplot(3,1,2)
plot(f2,abs(XX1)/length(x1))
xlim([-5000 5000]);
title('Frequency response of x1[n]');
xlabel('frequency');
ylabel('X1(f)');
subplot(3,1,3)
plot(f3,abs(XX2)/length(x2))
xlim([-5000 5000]);
title('Frequency response of x2[n]');
xlabel('frequency');
ylabel('X2(f)');

xd1 = downsample(x1,5);
xd2 = downsample(x2,2);

td1 = downsample(t1,5);
td2 = downsample(t2,2);

figure
subplot(2,1,1)
stem(td1,xd1)
title('downsampled x1[n] by 5')
xlabel('n');
ylabel('xd1[n]');
subplot(2,1,2)
stem(td2,xd2)
title('downsampled x2[n] by 2')
xlabel('n');
ylabel('xd2[n]');
