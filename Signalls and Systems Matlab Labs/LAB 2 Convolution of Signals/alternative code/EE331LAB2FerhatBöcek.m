n=0:50;
delta_x11 = n == 0;
delta_x12 = n == 1;

x_n = 0.5*delta_x11 + 2*delta_x12;

figure(1)
subplot(3,1,1);
stem(n,x_n);
xlabel('n');
ylabel('amplitude');
title('x_n');

unit_step_0 = n >= 0;
h1_n = (-0.5).^n .* unit_step_0;

subplot(3,1,2);
stem(n,h1_n);
xlabel('n');
ylabel('amplitude');
title('h1_n');
unit_step_4 = n >= 4;
h2_n = unit_step_0 - unit_step_4;

subplot(3,1,3);
stem(n,h2_n);
xlabel('n');
ylabel('amplitude');
title('h2_n');

% for 5.3)
%a)
ya1_n = ArdaMetinAkdarconvolve(x_n,h1_n);
ya2_n = ArdaMetinAkdarconvolve(ya1_n,h2_n);

figure(2)
subplot(2,2,1);
stem(1:1:21,ya2_n(1,1:1:21));
xlabel('n');
ylabel('amplitude');
title('y1_n');
%b)

hb_n = ArdaMetinAkdarconvolve(h1_n,h2_n);
yb_n = ArdaMetinAkdarconvolve(x_n,hb_n);
subplot(2,2,2);
stem(1:1:21,yb_n(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y2_n');
%c)

hc_n = ArdaMetinAkdarconvolve(h2_n,h1_n);
yc_n = ArdaMetinAkdarconvolve(x_n,hc_n);
subplot(2,2,3);
stem(1:1:21,yc_n(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y3_n');
%d)

yd1_n = ArdaMetinAkdarconvolve(x_n,h2_n);
yd2_n = ArdaMetinAkdarconvolve(yd1_n,h1_n);
subplot(2,2,4);
stem(1:1:21,yd2_n(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y4_n');
%with conv function

%a)
ya1_n_c = conv(x_n,h1_n);
ya2_n_c = conv(ya1_n,h2_n);

figure(3)
subplot(2,2,1);
stem(1:1:21,ya2_n_c(1,1:1:21));
xlabel('n');
ylabel('amplitude');
title('y1_n');
%b)

hb_n_c = conv(h1_n,h2_n);
yb_n_c = conv(x_n,hb_n);
subplot(2,2,2);
stem(1:1:21,yb_n_c(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y2_n');
%c)

hc_n_c = conv(h2_n,h1_n);
yc_n_c = conv(x_n,hc_n);
subplot(2,2,3);
stem(1:1:21,yc_n_c(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y3_n');
%d)

yd1_n_c = conv(x_n,h2_n);
yd2_n_c = conv(yd1_n,h1_n);
subplot(2,2,4);
stem(1:1:21,yd2_n_c(1:1:21));
xlabel('n');
ylabel('amplitude');
title('y4_n');

figure(4)
plot(yd1_n_c,yd1_n);


