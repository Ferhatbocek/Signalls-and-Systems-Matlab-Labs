n = 0:1:50;

unitImpulse0 = (n == 0);
unitImpulse1 = (n == 1);
x = 0.5 * unitImpulse0 + 2 * unitImpulse1;

unitStep0 = (n >= 0);
h1 = unitStep0 .* (-0.5).^n;

unitStep4 = (n >= 4);
h2 = unitStep0 - unitStep4;

figure(1);
subplot(3, 1, 1);
stem(n, x);
xlabel("n");
ylabel("x[n]");
subplot(3, 1, 2);
stem(n, h1);
xlabel("n");
ylabel("h_1[n]");
subplot(3, 1, 3);
stem(n, h2);
xlabel("n");
ylabel("h_2[n]");

EmirhanTasdevirenY1 = EmirhanTasdevirenConv(EmirhanTasdevirenConv(x, h1), h2);
EmirhanTasdevirenY2 = EmirhanTasdevirenConv(x, EmirhanTasdevirenConv(h1, h2));
EmirhanTasdevirenY3 = EmirhanTasdevirenConv(x, EmirhanTasdevirenConv(h2, h1));
EmirhanTasdevirenY4 = EmirhanTasdevirenConv(EmirhanTasdevirenConv(x, h2), h1);
figure(2);
subplot(2, 2, 1);
stem(EmirhanTasdevirenY1(1:21));
xlabel("n");
ylabel("myY_1[n]");
subplot(2, 2, 2);
stem(EmirhanTasdevirenY2(1:21));
xlabel("n");
ylabel("myY_2[n]");
subplot(2, 2, 3);
stem(EmirhanTasdevirenY3(1:21));
xlabel("n");
ylabel("myY_3[n]");
subplot(2, 2, 4);
stem(EmirhanTasdevirenY4(1:21));
xlabel("n");
ylabel("myY_4[n]");

y1 = conv(conv(x, h1), h2);
y2 = conv(x, conv(h1, h2));
y3 = conv(x, conv(h2, h1));
y4 = conv(conv(x, h2), h1);
figure(3);
subplot(2, 2, 1);
stem(y1(1:21));
xlabel("n");
ylabel("y_1[n]");
subplot(2, 2, 2);
stem(y2(1:21));
xlabel("n");
ylabel("y_2[n]");
subplot(2, 2, 3);
stem(y3(1:21));
xlabel("n");
ylabel("y_3[n]");
subplot(2, 2, 4);
stem(y4(1:21));
xlabel("n");
ylabel("y_4[n]");