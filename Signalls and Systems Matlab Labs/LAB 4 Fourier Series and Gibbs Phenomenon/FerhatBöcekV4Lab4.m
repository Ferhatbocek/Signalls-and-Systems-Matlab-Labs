clc;
clear all;
close all;

dt = 0.001;
T = 10;
f = 0.2;
w = 2 * pi / T;
theta = 6 * dt;

t1 = 0:dt:5;
t2 = 5 + dt:dt:10;

x1 = -exp(-t1);
x2 = -sin(2 * pi * f * t2 + theta);

int_x_t = [x1, x2];

x_cal = zeros(1, length(int_x_t));
x_cal(1) = 1;
i = 2;
for t = 0 + dt:dt:T
    x_cal(i) = (int_x_t(i) - int_x_t(i - 1)) / dt;
    i = i + 1;
end

plot([t1, t2], int_x_t);
hold on;
plot([t1, t2], x_cal);
legend("integral of x(t)", "x(t)");

c_k = zeros(1, length(-3000:1:3000));
for k = -3000:1:3000
    i = 1;
    for t = 0:dt:T
        c_k(k + 3001) = c_k(k + 3001) + (1 / T) * x_cal(i) * exp(-1i * k * w * t) * dt;
        i = i + 1;
    end
end

m = [50, 200, 500, 1000];
mse = zeros(1, 4);

for i = 1:1:4
    x_n_t = zeros(1, length(x_cal));
    j = 1;
    for t = 0:dt:T
        temp = 0;
        for k = -m(i) : 1 : m(i) - 1
            temp = temp + c_k(k + 3001) * exp(1i * k * w * t);
        end
        x_n_t(j) = real(temp);
        j = j + 1;
    end

    j = 1;
    for t = 0:dt:T
        mse(i) = mse(i) + (x_n_t(j) - x_cal(j))^2;
        j = j + 1;
    end
    mse(i) = mse(i) / length(x_cal);

    figure;
    plot([t1 t2], x_n_t);
    txt = sprintf("M = %i", m(i));
    title(txt);
    xlabel("t (s)");
    ylabel("x_N(t)");
end

figure;
plot(m, mse);
title("Mean Square Error")
xlabel("M");
ylabel("MSE");
