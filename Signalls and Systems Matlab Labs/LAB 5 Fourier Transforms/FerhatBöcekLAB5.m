clc;
clear all;
close all;

%% part 1

i=1;
dt=1/60000;
f1 = 1000;
f2 = 4000;
N=300;
for t=0:dt:0.005
       s1(i) = sin(2*pi*f1*t) + cos(2*pi*f2*t);
       i=i+1
end
t=0:dt:0.005;
figure(1)
plot(t,s1)
xlabel('Time (s)');
ylabel('Amplitude');
title('s(t)');

f=linspace(-30000,29999,N);

Sf =fft(s1,N);
Sf =fftshift(Sf)
L=length(f);

fshift = (-L/2:L/2-1)*(N/L);

figure(2)
plot(fshift,abs(Sf))
xlabel('Frequency (s)');
ylabel('Amplitude');
title('s(f)');
%% part 2
i=1;
for t=-3:1/100:3
   
    if(t<=-1)
        x(i)=0;
    elseif(t>-1) && (t<=1)
        x(i)=1;
    elseif(t>1) && (t<=3)
        x(i)=0;
    end
 i=i+1
end

t=-3:1/100:3;
figure(3)
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('x(t)');

f2=linspace(-100,100,1201);

Xf =fft(x,1201);
Xf =fftshift(Xf)

figure(4)

axis([-10 10 0 200])

plot(f2,abs(Xf));
xlabel('Frequency (f)');
ylabel('Amplitude');
title('X(f)');

x_c=conv(x,x);

Yf = Xf.*Xf;

y_t=ifft(Yf,1201);

figure(5)
subplot(2,1,1)
plot(t,x_c);
subplot(2,1,2)
plot(y_t);
