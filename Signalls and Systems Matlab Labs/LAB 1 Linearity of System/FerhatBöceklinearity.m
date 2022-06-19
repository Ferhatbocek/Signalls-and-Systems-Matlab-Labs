t = linspace(0, 1, 250);
tp = t + 2;

x1 = 2.3 * exp(2 * t);
x2 = 1.2 * cos(50 * pi * t);
x3 = x1 + x2;

y1 = -5 * 2.3 * exp(2 * (tp - 2)) / 2;
y2 = -5 * 1.2 * cos(50 * tp) / 2;
y3 = -5 * () / 2;
additivity_y3 = y1 + y2;
%
figure(1);
%
subplot(2, 2, 1);
plot(t, x1);
hold on;
plot(t, x2);
xlabel("t (s)");
legend("x_1(t)", "x_2(t)");
%
subplot(2, 2, 2);
plot(t, x3);
ylabel("x_3(t)");
xlabel("t (s)");
%
subplot(2, 2, 3);
plot(tp, y1);
hold on;
plot(tp, y2);
legend("y_1(t)", "y_2(t)");
%
subplot(2, 2, 4);
plot(tp, y3);
hold on;
plot(tp, additivity_y3);
xlabel("t (s)");
legend("y_3(t)", "y_1(t) + y_2(t)");
