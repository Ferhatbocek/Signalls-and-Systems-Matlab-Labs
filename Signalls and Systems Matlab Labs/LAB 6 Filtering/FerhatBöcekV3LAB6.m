clc;
clear all;
close all;
%%part1

f1 = 50;
f2 = 200;
f3 = 500
Fs = 5e3;

frequency = linspace(0,Fs,501);

t = -0.05:1/Fs:0.05;

x_t = 0.1*(sin(2*pi*f1*t))+0.5*(cos(2*pi*f2*t))-0.9*(sin(2*pi*f3*t));

figure(1)
subplot(2,1,2)
subplot(2,1,1)
plot(t,x_t)
xlabel('time')
subplot(2,1,2)
plot(frequency,x_t)
xlabel('frequency')

%%part2

%9.3

[b_3_1 a_3_1] = butter(1,0.0015,'low');

[b_3_2 a_3_2] = butter(7,0.0015,'low');


%9.4

[b_4_1 a_4_1] = butter(1,0.0070,'high');
[b_4_2 a_4_2] = butter(7,0.0070,'high');

%9.5

[b_5_1 a_5_1] = butter(1,[0.0015 0.0070],'bandpass');
[b_5_2 a_5_2] = butter(7,[0.0015 0.0070],'bandpass');

%9.6

figure(2)
subplot(3,1,3);

subplot(3,1,1)
H1 = freqz(b_3_1,a_3_1, floor(Fs/2));
hold on
plot([0:(Fs/2 -1)], abs(H1),'r');
hold on
H1_2 = freqz(b_3_2,a_3_2, floor(Fs/2));
plot([0:(Fs/2 -1)], abs(H1),'r');

subplot(3,1,2)
H2 = freqz(b_4_2,a_4_2, floor(Fs/2));
hold on
plot([0:(Fs/2 -1)], abs(H2),'r');

subplot(3,1,3)
H3 = freqz(b_5_1,a_5_1, floor(Fs/2));
hold on
plot([0:(Fs/2 -1)], abs(H3),'r');

%9.7

Y_lpf = filter(b_3_2,a_3_2,H1);

Y_hpf = filter(b_4_2,a_4_2,H2);

Y_bpf = filter(b_5_2,a_5_2,H3);

%9.8 

figure(3)
subplot(4,1,4);

subplot(4,1,1)
plot(t,x_t)

subplot(4,1,2)
plot(Y_lpf)

subplot(4,1,3)
plot(Y_hpf)

subplot(4,1,4)
plot(Y_bpf)
