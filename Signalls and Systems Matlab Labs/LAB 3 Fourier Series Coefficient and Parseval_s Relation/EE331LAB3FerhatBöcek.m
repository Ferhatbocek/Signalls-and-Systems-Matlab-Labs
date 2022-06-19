clc
clear all;
close all;

%Step a)

T=4;
dt=1/10000;
f=10;
t_1 = 0:dt:2-dt;
t_2 = 2:dt:4-dt;

x_1 = 3*(t_1-t_1+1);
x_2 = sin(2*pi*f*t_2);

figure(1)
plot(t_1,x_1)
figure(2)
plot(t_2,x_2)

t_t = [t_1,t_2];
x_t = [x_1,x_2];

figure(3)
plot(t_t,x_t)
xlabel('seconds')
ylabel('amplitude')
%Step b)

i = 1;
a_k = zeros(1,40001)
%a_k(1)=3;
k= -1000;

%{
for t=0:dt:4-dt
    a_k(i+1) = a_k(i) + x_t(i)*exp(-sqrt(-1)*k*2*pi/T*t) * dt;
    k = k+dt;
    i = i+1
end
%}

for t=0:dt:4-dt
    for k=-1000:1:1000
    a_k(i) = a_k(i) + (x_t(k+1001) * exp(-sqrt(-1)*k*2*pi/4*t) * 1/4 *dt);
    t = t + dt;
    end
    i = i+1;    
end

b = sum(abs(a_k).^2)

%Step c)
i=1;

average_power(i)=0
for t=0:dt:4-dt
    average_power(i+1) = average_power(i) + 1/4 * (abs(x_t(i))^2) * dt;
    i = i+1
end
b
c = average_power(i)

