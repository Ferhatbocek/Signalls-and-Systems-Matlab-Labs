clc;
clear all;


T=4;
Fs=10000;
fc=10;
t=0:(1/Fs):T;

t1=0:(1/Fs):2-(1/Fs);
t2=2:(1/Fs):4;
k=-1000:1:1000;
dt=1/Fs;

figure(1)
x1=3*ones(1,length(t1));
x2=sin(2*pi*fc*t2);
x3=[x1 x2];
plot(t,x3);
legend('x(t)');
xlabel('time(t)');
ylabel('x(t)');

w=(2*pi)/T;

for k=-1000:1:1000
     ck(k+1001) =  (1/T) * sum(x3.*exp(-1i*k*w*t)*dt);
end
y1 = sum(abs(ck).*abs(ck));

y2 = (1/T) * sum(abs(x3.^2)*dt);

y1
y2












