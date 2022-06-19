clc;
clear all;
close all;

%%Part a

f = 2e3;
T = 1 / f;
d = 4 * T;
Fs = 1e3 * f;
Ts = 1/Fs;

t = 0:Ts:d;

x_t = sin( 2 * pi * f * t);

plot(t,x_t)



%%Part b

T_s_1 = 1 / 25e3;
T_s_2 = 1/ 10e3;

n_1 = 0 : T_s_1 : d;
n_2 = 0 : T_s_2 : d;

x_n_1 = sin(2 * pi * f * n_1);
x_n_2 = sin(2 * pi * f * n_2);


%%Part c

figure(1)
subplot(3,1,1)
plot(t,x_t);
subplot(3,1,2);
stem(n_1,x_n_1);
subplot(3,1,3);
stem(n_2,x_n_2);

x_n_1_int = interp1(n_1, x_n_1, t);
x_n_2_int = interp1(n_2, x_n_2, t);

figure(2)
subplot(3,1,1)
plot(t,x_t);
subplot(3,1,2);
stem(t,x_n_1_int);
subplot(3,1,3);
stem(t,x_n_2_int);

%%10.1.1

X_w = fft(x_t, length(x_t));
X_w_1 = fft(x_n_1, length(x_n_1));
X_w_2 = fft(x_n_2, length(x_n_2));
