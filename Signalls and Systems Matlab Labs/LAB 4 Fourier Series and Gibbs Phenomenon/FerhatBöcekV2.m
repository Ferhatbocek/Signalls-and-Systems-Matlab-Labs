clc;
clear all;

T=10;
dt=0.001;
f=0.2;
theta=6*dt;

t1=0:dt:5;
t2=5+dt:dt:10;
t=0:dt:10;

y1=-exp(-t1);
y2=-sin((2*pi*f*t2)+theta);
y=[y1 y2];

plot(t,y);
grid on;
hold on;

x_cal=zeros(1,length(t));
x_cal(1)=1;

for n=1:1:(10/dt)-1

    x_cal(n+1) = (y(n+2)-y(n+1)) / (t(n+2)-t(n+1));
   
end

plot(t,x_cal);
grid on;
hold on;

%ssssssssssssssssssssssssssssssssssssss

ck=0;
w=(2*pi)/T;

for k=-3000:1:3000

    ck(k+3001) = (1/T) * sum(y.*exp(-1i*k*w*t)*dt);

end

%ssssssssssssssssssssssssssssssssssssssss

M1=50;
M2=200;
M3=500;
M4=1000;

%ssssssssssssssssssssssssssssssssssssssss

k=-3000:1:3000;
X1=0;

for i=3000-M1:1:3000+M1
    X1 = X1 + (ck(i).*exp(-1j.*k(i).*w.*t));
end

MSE1=0;
for i=-M1:1:M1
    
    MSE1 = MSE1 + ((real(X1(i+51))-y(i+51)).^2);

end

MSE1 = MSE1/M1;

%ssssssssssssssssssssssssssssssssssssssssssss

X2=0;

for i=3000-M2:1:3000+M2
    X2 = X2 + (ck(i).*exp(-1j.*k(i).*w.*t));
end
X2=X2/T;
MSE2=0;

for i=-M2:1:M2
    
    MSE2 = MSE2 + (real((X2(i+201))-y(i+201)).^2);

end

MSE2 = MSE2/M2;

%sssssssssssssssssssssssssssssssssssssssssss

X3=0;

for i=3000-M3:1:3000+M3
    X3 = X3 + (ck(i).*exp(-1j.*k(i).*w.*t));
end
X3=X3/T;

MSE3=0;

for i=-M3:1:M3
    
    MSE3 = MSE3 + (real((X3(i+501))-y(i+501)).^2);

end

MSE3 = MSE3/M3;

%sssssssssssssssssssssssssssssssssssssssssss

X4=0;

for i=3000-M4:1:3000+M4
    X4 = X4 + (ck(i).*exp(-1j.*k(i).*w.*t));
end
X4=X4/T;

MSE4=0;

for i=-M4:1:M4
    
    MSE4 = MSE4 + ((real(X4(i+1001))-y(i+1001)).^2);

end

MSE4 = MSE4/M4;

%sssssssssssssssssssssssssssssssssssssssssss

figure(2)
plot(t,flip(real(X1)));
grid on;
hold on;
figure(3)
plot(t,flip(real(X2)));
grid on;
hold on;
figure(4)
plot(t,flip(real(X3)));
grid on;
hold on;
figure(5)
plot(t,flip(real(X4)));
grid on;
hold on;

figure(6)
M=[50 200 500 1000];
MSE=[MSE1 MSE2 MSE3 MSE4];
plot(M,MSE);
grid on;
hold on;







