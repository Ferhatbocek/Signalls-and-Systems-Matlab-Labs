clc;
clear all;
close all;

% 7.1.a
f = 2e3;
F_s = 1e3 * f;
T_s = 1 / F_s;
T = 1 / f;
d = 4 * T;

t = 0 : T_s : d;
x_t = sin(2 * pi * f * t);

% 7.1.b
T_1_s = 1 / 25e3;
T_2_s = 1/ 10e3;

n_1 = 0 : T_1_s : d;
n_2 = 0 : T_2_s : d;

x_1_n = sin(2 * pi * f * n_1);
x_2_n = sin(2 * pi * f * n_2);

% 7.1.c
figure;
subplot(3, 1, 1);
plot(t, x_t);
title("Sampling")
xlabel("t (seconds)");
ylabel("x(t)");
subplot(3, 1, 2);
stem(n_1, x_1_n);
xlabel("n (samples)");
ylabel("x_1[n]");
subplot(3, 1, 3);
stem(n_2, x_2_n);
xlabel("n (samples)");
ylabel("x_2[n]");

% 7.1.d
x_1_n_interp = interp1(n_1, x_1_n, t);
x_2_n_interp = interp1(n_2, x_2_n, t);

% 7.1.e
figure;
subplot(3, 1, 1);
plot(t, x_t);
title("Interpolation");
xlabel("t (seconds)");
ylabel("x(t)");
subplot(3, 1, 2);
plot(t, x_1_n_interp);
xlabel("t (seconds)");
ylabel("x_1(t)");
subplot(3, 1, 3);
plot(t, x_2_n_interp);
xlabel("t (seconds)");
ylabel("x_2(t)");

% ---

% 7.1.1.f
big_x = fft(x_t, length(x_t));
big_x_1 = fft(x_1_n, length(x_1_n));
big_x_2 = fft(x_2_n, length(x_2_n));

f = linspace(-F_s / 2, F_s / 2, length(x_t));
f_1 = linspace(-25e3 / 2, 25e3 / 2, length(x_1_n));
f_2 = linspace(-10e3 / 2, 10e3 / 2, length(x_2_n));

% 7.1.1.g
figure;
subplot(3, 1, 1);
plot(f, abs(fftshift(big_x)) / length(x_t));
title("Frequency Domain Analysis");
xlim([-5e3, 5e3]);
xlabel("f");
ylabel("|X(f)|");
subplot(3, 1, 2);
plot(f_1, abs(fftshift(big_x_1)) / length(x_1_n));
xlim([-5e3, 5e3]);
xlabel("f");
ylabel("|X_1(f)|");
subplot(3, 1, 3);
plot(f_2, abs(fftshift(big_x_2)) / length(x_2_n));
xlabel("f");
ylabel("|X_2(f)|");

% 7.2.a
x_d1_n = downsample(x_1_n, 5);
n_d1 = downsample(n_1, 5);

x_d2_n = downsample(x_2_n, 2);
n_d2 = downsample(n_2, 2);

% 7.2.b
figure;
subplot(2, 1, 1);
stem(n_d1, x_d1_n);
title("Downsampling");
xlabel("n (samples)");
ylabel("x_{d1}[n]");
subplot(2, 1, 2);
stem(n_d2, x_d2_n);
xlabel("n (samples)");
ylabel("x_{d2}[n]");