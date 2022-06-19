clc;
clear all;
close all;

T = 4;
dt = 1 / 10000;
f = 10;
w = 2 * pi / T;

t_1 = 0 : dt : 2 - dt;
t_2 = 2 : dt : 4 - dt;

x_1 = ones(1, length(t_1)) * 3;
x_2 = sin(2 * pi * f * t_2);

x_t = [x_1, x_2];
a_k = zeros(1, length(-1000:1:1000));

i = 1;
for k = -1000:1:1000
    j = 1;
    for t = 0 : dt : 4 - dt
        a_k(i) = a_k(i) + (1 / T) * x_t(j) * exp(-sqrt(-1) * k * w * t) * dt;
        j = j + 1;
    end
    i = i + 1;
end

b = sum(abs(a_k).^2);

c = 0;
i = 1;
for t = 0 : dt : 4 - dt
    c = c + (1 / T) * abs(x_t(i))^2 * dt;
    i = i + 1;
end


