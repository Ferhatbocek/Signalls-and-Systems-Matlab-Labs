clc
clear all
close all

%step1)

T = 10;
dt = 0.001;
f = 0.2;
theta = 6*dt;
w = 2*pi/f

t1 = [0:dt:5];
t2 = [5:dt:10];

x1 = -exp(-t1)
x2 = -sin(2*pi*f*t2+theta)


x_t = [x1,x2];
t_t = [t1,t2];


%Step2)

%x_cal = zeros(1,1000);
x_cal(1)= 1;

for i = 1:1:T/dt+1
    x_cal(i+1) = (x_t(i+1)-x_t(i))/dt;

end




%Step3)

figure(1)
plot(t_t,x_t);
hold on
plot(t_t,x_cal);
xlabel('t   time');
ylabel('amplitude');
title('integral of x(t) and x(t)');


%Step 4)

c_k = zeros(1,10000);

for k=-3000:1:3000
    i = 1;
    for t=0:dt:T-dt
        c_k(k+3001) = c_k(k+3001) + (x_t(i) * exp(-sqrt(-1)*k*2*pi/T*t) * 1/T *dt);
        i = i + 1;
    end
end

%Step 5)


T = length(x_t);
t = 1:dt:T;
k = -3000:1:3000;
x_approximated1 = zeros(1,10000)

i=1;
for t = 1:dt:T
    temp1 = 0;
    for k=-50:1:50
        temp1 = temp1 + c_k(k+3001).*exp(1i*k*w*t);
    end
    i=i+1;
       x_approximated1(i) = real(temp1);
end

i=1;
for t = 1:dt:T
    temp2 = 0;
    for k=-200:1:200
        temp2 = temp2 + c_k(k+3001).*exp(1i*k*w*t);
    end
    i=i+1;
    x_approximated2(i) = real(temp1);
end

for t = 1:dt:T
    temp3 = 0;
    for k=-500:1:500
        temp3 = temp3 + c_k(k+3001).*exp(1i*k*w*t);
    end
    x_approximated3(i) = real(temp1);
end

for t = 1:dt:T
    temp4 = 0;
    for k=-1000:1:1000
        temp4 = temp4 + c_k(k+3001).*exp(1i*k*w*t);
    end
    x_approximated4(i) = real(temp1);
end



