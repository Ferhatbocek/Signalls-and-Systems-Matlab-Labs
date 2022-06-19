% EE331 - Lab Final - Q1
% Emirhan Tasdeviren
% 270206027

clc;
clear all;
close all;

T_s = 1e-3;
F_s = 1 / T_s;
d = 0.4;
t = 0 : T_s : d;
N = length(t);

x_t = zeros(1, N);
x_t(1 : 200) = 1;

y_t = ones(1, N);
y_t(201 : 400) = 2;
y_t(401) = 0;

big_x = fft(x_t, N);
big_y = fft(y_t, N);
big_h = big_y ./ big_x;

f = linspace(-F_s / 2, F_s / 2, N);
figure;
subplot(2, 1, 1);
plot(f, abs(fftshift(big_x)) / N);
title("Magnitude Response");
xlabel("f (Hz)");
ylabel("|X(f)|");
subplot(2, 1, 2);
plot(f, abs(fftshift(big_y)) / N);
xlabel("f (Hz)");
ylabel("|Y(f)|");

h_t = ifft(big_h, N);

figure;
subplot(3, 1, 1);
plot(t, x_t);
subtitle("Input");
xlabel("t (s)");
ylabel("x(t)");
subplot(3, 1, 2);
plot(t, y_t);
subtitle("Output");
xlabel("t (s)");
ylabel("y(t)");
subplot(3, 1, 3);
plot(t, h_t);
subtitle("Impulse Response");
xlabel("t (s)");
ylabel("h(t)");