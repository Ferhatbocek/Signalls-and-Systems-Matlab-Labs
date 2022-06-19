% EE331 - Lab Final - Q2
% Emirhan Tasdeviren
% 270206027

clc;
clear all;
close all;

F_s = 5e3;
T_s = 1 / F_s;
D = 0.5;
t = 0 : T_s : D;

x_t = 3 * cos(2 * pi * 50 * t) + 0.8 * sin(2 * pi * 250 * t) + cos(2 * pi * 900 * t) + 3 * sin(2 * pi * 2200 * t);

[bpf_b, bpf_a] = butter(10, [150 1550] / (F_s / 2), "bandpass");
y1_t = filter(bpf_b, bpf_a, x_t);

figure;
plot(y1_t);
title("ANAN");

[lpf_b, lpf_a] = butter(10, 1550 / (F_s / 2), "low");
[hpf_b, hpf_a] = butter(10, 150 / (F_s / 2), "high");
y2_t = filter(hpf_b, hpf_a, filter(lpf_b, lpf_a, x_t));

N = 1024;
f = linspace(-F_s / 2, F_s / 2, N);
big_x = fft(x_t, N);
big_y1 = fft(y1_t, N);
big_y2 = fft(y2_t, N);

figure;
subplot(3, 1, 1);
plot(f, abs(fftshift(big_x)) / N);
title("Frequency Response");
xlabel("f (Hz)");
ylabel("X(f)");
subplot(3, 1, 2);
plot(f, abs(fftshift(big_y1)) / N);
xlabel("f (Hz)");
ylabel("Y_1(f)");
subplot(3, 1, 3);
plot(f, abs(fftshift(big_y2)) / N);
xlabel("f (Hz)");
ylabel("Y_2(f)");

h_bpf = freqz(bpf_b, bpf_a, F_s / 2);
h_lpf = freqz(lpf_b, lpf_a, F_s / 2);
h_hpf = freqz(hpf_b, hpf_a, F_s / 2);

figure;
subplot(2, 1, 1);
plot(abs(h_bpf));
title("Frequency Response of Filters");
legend("Bandpass Filter");
xlabel("f (Hz)");
subplot(2, 1, 2);
plot(abs(h_lpf));
hold on;
plot(abs(h_hpf));
hold off;
legend("Low-Pass Filter", "High-Pass Filter")
xlabel("f (Hz)");
