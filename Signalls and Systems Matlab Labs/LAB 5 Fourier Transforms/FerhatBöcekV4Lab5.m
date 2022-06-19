clc;
clear all;
close all;

f_1 = 1000;
f_2 = 4000;
F_s = 60000;
dt = 1 / F_s;
t = 0 : dt : 0.005;

% 8.1.a
s_t = sin(2 * pi * f_1 * t) + cos(2 * pi * f_2 * t);

% 8.1.b
figure;
plot(t, s_t);
xlabel("t (seconds)");
ylabel("s(t)");

% 8.1.c
N = length(s_t);
f_v = linspace(-F_s / 2, F_s / 2, N);

% 8.1.d
big_s_f = fft(s_t, N);

% 8.1.e
figure;
plot(f_v, abs(fftshift(big_s_f)) / N);
xlabel("f (Hz)");
ylabel("|S(f)|");

% -------------------------------------------------------------------------

% 8.2.a
F_s = 100;
dt = 1 / F_s;
t = -3 : dt : 3;
x_t = zeros(1, length(t));
for i = 201 : 1 : 401
    x_t(i) = 1;
end

% 8.2.b
figure;
plot(t, x_t);
xlabel("t (seconds)");
ylabel("x(t)");

% 8.2.c
N = 1201;
f_v = linspace(-F_s / 2, F_s / 2, N);
big_x_f = fft(x_t, N);

% 8.2.d
figure;
plot(f_v, abs(fftshift(big_x_f)) / N);
xlim([-10 10]);
xlabel("f (Hz)");
ylabel("|X(f)|");

% 8.2.e
x_c_t = conv(x_t, x_t);

% 8.2.f
big_y_f = big_x_f .* big_x_f;

% 8.2.g
y_t = ifft(big_y_f, N);

% 8.2.h
figure;
subplot(2, 1, 1);
plot(x_c_t);
xlabel("Samples");
ylabel("x_c(t)");
subplot(2, 1, 2);
plot(y_t);
xlabel("Samples");
ylabel("y(t)");