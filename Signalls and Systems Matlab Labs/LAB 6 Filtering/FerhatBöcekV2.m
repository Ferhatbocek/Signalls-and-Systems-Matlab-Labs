clc;clear all;close all
%% Yiğit Öksüz 260206055
%% 9.1
f1 = 50;
f2 = 200;
f3 = 500;
Fs = 5000;
t = -0.05:1/(Fs):0.05;
x = 0.1.*sin(2.*pi.*50.*t) + 0.5.*cos(2.*pi.*f2.*t) + -0.9.*sin(2.*pi.*f3.*t);
%% 9.2
subplot(121),plot(t,x);xlabel('t(s)');ylabel('Amplitude'),title('time domain');
f = linspace(-Fs/2,Fs/2,length(x));
X = fft(x);
subplot(122),plot(f,fftshift(abs(X)));xlabel('f(s^(-1)');ylabel('X(f)'),title('frequency domain');
figure
%% 9.3
n1 = 1;
n2 = 7;
Fcl = 75;
[ bl_1, al_1 ] = butter(n1, Fcl./(Fs/2), 'low');
[ bl_2, al_2 ] = butter(n2, Fcl./(Fs/2), 'low');
%% 9.4
Fch = 350;
[bh_1, ah_1 ] = butter(n1, Fch./(Fs/2), 'high');
[bh_2, ah_2 ] = butter(n2, Fch./(Fs/2), 'high');
%% 9.5
Fcb = [ 75, 350 ];
[ bs_1, as_1 ] = butter(n1, Fcb./(Fs/2), 'bandpass');
[ bs_2, as_2 ] = butter(n2, Fcb./(Fs/2), 'bandpass');
%% 9.6
sample = linspace(0,Fs./2,2500);
low_1 = freqz(bl_1,al_1,Fs./2);
low_2 = freqz(bl_2,al_2,Fs./2);
high_1 = freqz(bh_1,ah_1,Fs./2);
high_2 = freqz(bh_2,ah_2,Fs./2);
band_1 = freqz(bs_1,as_1,Fs./2);
band_2 = freqz(bs_2,as_2,Fs./2);
subplot(311),plot(sample,abs(low_1),'-r'),title('lowpass filter');
hold on
plot(sample,abs(low_2),'-k');
legend('first order','7th order');
subplot(312),plot(sample,abs(high_1),'-r'),title('highpass filter');
hold on
plot(sample,abs(high_2),'-k');
legend('first order','7th order');
subplot(313),plot(sample,abs(band_1),'-r'),title('bandpass filter');
hold on
plot(sample,abs(band_2),'-k');
legend('first order','7th order');
figure
%% 9.7
lowpass_filtered = filter(bl_2,al_2,x);
highpass_filtered = filter(bh_2,ah_2,x);
bandpass_filtered = filter(bs_2,as_2,x);
%% 9.8
output_low = fft(lowpass_filtered,501);
output_high = fft(highpass_filtered,501);
output_band = fft(bandpass_filtered,501);
subplot(411),plot(t,x);title('the original signal')
subplot(412),plot(t,fftshift(abs(output_low)));title('lowpass filter');
subplot(413),plot(t,fftshift(abs(output_high)));title('highpass filter');
subplot(414),plot(t,fftshift(abs(output_band)));title('bandpass filter');
