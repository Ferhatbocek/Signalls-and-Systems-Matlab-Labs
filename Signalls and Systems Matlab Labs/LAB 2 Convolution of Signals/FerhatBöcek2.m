clc

n = (0:50);
%t =(-2:0.001:50);

impulse = n==0;
impulse2 = n==1;
un = n>=0;
figure(1)
xn = 0.5*impulse + 2.0*impulse2;
h1n = ((-0.5).^n);
h2n = [ones(1,4),zeros(1,47)];
subplot(3,1,1);
stem(n,xn)
title('x[n]');
xlabel('n');

subplot(3,1,2);
stem(n,h1n);
title('h1[n]');
xlabel('n');

subplot(3,1,3);
stem(n,h2n);
title('h2[n]');
xlabel('n');

figure(2)
y0n = CanKayanConvolve(xn,h1n);
y11n= CanKayanConvolve(y0n,h2n);
sample1 = sample(y11n);
n21=(0:20);
length(xn);
n0 = [n zeros(1,50)];
%yn = [y0n zeros(1,(50-length(y0n)))];
subplot(2,2,1);
stem(n21,sample1);
title("x[n]-->h1[n]-->h2[n]-->y1[n]")
xlabel('n');

subplot(2,2,2);
h1nh2n=CanKayanConvolve(h1n,h2n);
xnh1nh2n= CanKayanConvolve(xn,h1nh2n);
yn2 = sample(xnh1nh2n);
stem(n21,yn2);
title("x[n]-->h1[n]*h2[n]-->y2[n]")
xlabel('n');

subplot(2,2,3);
h2nh1n=CanKayanConvolve(h2n,h1n);
xnh2nh1n= CanKayanConvolve(xn,h2nh1n);
yn3 = sample(xnh2nh1n);
stem(n21,yn2);
title("x[n]-->h2[n]*h1[n]-->y3[n]")
xlabel('n');


subplot(2,2,4);
y01n = CanKayanConvolve(xn,h2n);
y112n= CanKayanConvolve(y01n,h1n);
sample_yn4 = sample(y112n);
stem(n21,sample_yn4);
title("x[n]-->h2[n]-->h1[n]-->y4[n]")
xlabel('n');

figure(3)
conv0 = conv(xn,h1n);
conv_y1n = conv(conv0,h2n);
y1nconv=sample(conv_y1n);
subplot(2,2,1);
stem(n21,y1nconv);
title("x[n]-->h1[n]-->h2[n]-->y1[n] (with conv function)")
xlabel('n');

conv1 = conv(h1n,h2n);
conv_y2n = conv(xn,conv1);
y2nconv=sample(conv_y2n);
subplot(2,2,2);
stem(n21,y2nconv);
title("x[n]-->h1[n]*h2[n]-->y2[n] (with conv function)")
xlabel('n');

conv3 = conv(h2n,h1n);
conv_y3n = conv(xn,conv3);
y3nconv=sample(conv_y3n);
subplot(2,2,3);
stem(n21,y3nconv);
title("x[n]-->h2[n]*h1[n]-->y3[n] (with conv function)")
xlabel('n');

conv4 = conv(xn,h2n);
conv_y4n = conv(conv4,h1n);
y4nconv=sample(conv_y4n);
subplot(2,2,4);
stem(n21,y4nconv);
title("x[n]-->h2[n]-->h1[n]-->y4[n] (with conv function)")
xlabel('n');


function[y] = CanKayanConvolve(xn,hn)

xn1 = [xn,zeros(1,length(hn)-1)];
hn1 = [hn,zeros(1,length(xn)-1)];
len = length(xn) + length(hn) -1;

zero = zeros(1,len);

for i=1:len
    for j=1:i
        zero(i) = zero(i) + xn1(j)*hn1(i-j+1);
    
    end
end
y = zero;
end


function[n0]=sample(n) %returns an array of 21 elements for sampling
zero = zeros(1,21);
for i=1:21
    zero(i)=n(i);
end
n0 = zero;
end








