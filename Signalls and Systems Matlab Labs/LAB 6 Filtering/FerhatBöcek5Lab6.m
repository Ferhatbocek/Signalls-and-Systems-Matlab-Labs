clc;
clear all;
close all;

% 9.1
f_1 = 50;
f_2 = 200;
f_3 = 500;

F_s = 5e3;
dt = 1 / F_s;
t = -0.05 : dt : 0.05;

x = 0.1 * sin(2 * pi * f_1 * t) + 0.5 * cos(2 * pi * f_2 * t) - 0.9 * sin(2 * pi * f_3 * t);

% 9.2
N = length(x);
f = linspace(-F_s / 2, F_s / 2, N);
big_x = fft(x, N);

figure;
subplot(2, 1, 1);
plot(t, x);
xlabel("t (seconds)");
ylabel("x(t)");
subplot(2, 1, 2);
plot(f, abs(fftshift(big_x))/ N);
xlabel("f (hertz)");
ylabel("X(f)");

% 9.3
[low_b_1, low_a_1] = butter(1, 75 / 2.5e3, "low");
[low_b_7, low_a_7] = butter(7, 75 / 2.5e3, "low");
% 9.4
[high_b_1, high_a_1] = butter(1, 350 / 2.5e3, "high");
[high_b_7, high_a_7] = butter(7, 350 / 2.5e3, "high");
% 9.5
[bandpass_b_1, bandpass_a_1] = butter(1, [75 350] / 2.5e3, "bandpass");
[bandpass_b_7, bandpass_a_7] = butter(7, [75 350] / 2.5e3, "bandpass");

% 9.6
h_low_1 = freqz(low_b_1, low_a_1, F_s / 2);
h_low_7 = freqz(low_b_7, low_a_7, F_s / 2);

h_high_1 = freqz(high_b_1, high_a_1, F_s / 2);
h_high_7 = freqz(high_b_7, high_a_7, F_s / 2);

h_band_1 = freqz(bandpass_b_1, bandpass_a_1, F_s / 2);
h_band_7 = freqz(bandpass_b_7, bandpass_a_7, F_s / 2);

figure;

subplot(3, 1, 1);
hold on;
plot(abs(h_low_1));
plot(abs(h_low_7));
subtitle("Low-Pass Filter");
legend("n = 1", "n = 7");

subplot(3, 1, 2);
hold on;
plot(abs(h_high_1));
plot(abs(h_high_7));
subtitle("High-Pass Filter");
legend("n = 1", "n = 7");

subplot(3, 1, 3);
hold on;
plot(abs(h_band_1));
plot(abs(h_band_7));
subtitle("Bandpass Filter");
legend("n = 1", "n = 7");

% 9.7
y_lpf = filter(low_b_7, low_a_7, x);
y_hpf = filter(high_b_7, high_a_7, x);
y_bpf = filter(bandpass_b_7, bandpass_a_7, x);

% 9.8
figure;
subplot(4, 1, 1);
plot(f, abs(fftshift(big_x)) / N);
xlabel("f (hertz)");
ylabel("X(f)");
subplot(4, 1, 2);
plot(f, abs(fftshift(fft(y_lpf))) / N);
xlabel("f (hertz)");
ylabel("X_{LPF}(f)");
subplot(4, 1, 3);
plot(f, abs(fftshift(fft(y_hpf))) / N);
xlabel("f (hertz)");
ylabel("X_{HPF}(f)");
subplot(4, 1, 4);
plot(f, abs(fftshift(fft(y_bpf))) / N);
xlabel("f (hertz)");
ylabel("X_{BPF}(f)");
