%High frequency ripples and overshoot near the discontinuities
%Since the square wave satisfies dirichtet conditions, xn(t) discontinuites
%should convergeto the average value at both ends of th this continuity.
%The ripples do not decrease with increasing N. // OVershoot is %9 height

clc;
%step 1
T=10;
dt=0.001;
f=0.2;
theta=6*dt;
t1=(0:dt:5);
t2=(5.001:dt:10);
t=(0:dt:10);

x1t = -exp(-t1);
x2t = -sin(2*pi*f*t2 + theta);

xt_int = [x1t x2t];
x_cal=zeros(1,10001);
%step2
for i=2:10001
    
    x_cal(i) = (xt_int(i) - xt_int(i-1))/dt;
    
end  
x_cal(1)=1;


%step 3
figure(1);
plot(t,xt_int);
hold on;
plot(t,x_cal);
grid on;
legend('Integral of the x(t)','x-cal(t)');

%step4

w=2*pi/T;
coef = zeros(1,6001);
k=-3000;
for i=1:6001
    %t0=0;
    for x=1:10001
        
        coef(i) = coef(i) + x_cal(x)*(exp(-1j*k*w*t(x)))*dt;
        %t0=t0+dt;
    end 
    coef(i) = coef(i)/T;
k=k+1;
end
coef;

%step5

M=[50 200 500 1000];
x_ap1 = zeros(1,length(t));
x_ap2 = zeros(1,length(t));
x_ap3 = zeros(1,length(t));
x_ap4 = zeros(1,length(t));


l=1;
for r=1:10001

        for x=-M(1):M(1)-1
            x_ap1(l) = x_ap1(l) +  coef(x+3001)*exp(1j*x*w*t(r));
        end    
        x_ap1(l)=real(x_ap1(l));
        l=l+1;
end

l=1;
for r=1:10001

        for x=-M(2):M(2)-1
            x_ap2(l) = x_ap2(l) +  coef(x+3001)*exp(1j*x*w*t(r));
        end  
        x_ap2(l)=real(x_ap2(l));
        l=l+1;
end

l=1;
for r=1:10001

        for x=-M(3):M(3)-1
            x_ap3(l) = x_ap3(l) + coef(x+3001)*exp(1j*x*w*t(r));
        end    
        x_ap3(l)=real(x_ap3(l));
        l=l+1;
end

l=1;
for r=1:10001
        for x=-M(4):M(4)-1
            x_ap4(l) = x_ap4(l) + coef(x+3001)*exp(1j*x*w*t(r));
        end   
        x_ap4(l)=real(x_ap4(l));
        l=l+1;
end

figure(2);
plot(t,x_ap1);
legend("M=50");
grid on;
hold on;
figure(3);
plot(t,x_ap2);
legend("M=200");
grid on;
hold on;
figure(4);
plot(t,x_ap3);
legend("M=500");
grid on;
hold on;
figure(5);
plot(t,x_ap4);
hold on;
grid on;
legend('m=1000');

%step 6

MSE=zeros(1,4);
i=1;
for r=1:10001
        MSE(i) = MSE(i) + ((x_ap1(r)-x_cal(r)).^2);
end  
MSE(i)=(1/10001)*MSE(i);
i=i+1; 



for r=1:10001
        MSE(i) = MSE(i) + ((x_ap2(r)-x_cal(r)).^2);
end 
MSE(i)=(1/10001)*MSE(i);
i=i+1;
  
for r=1:10001
        MSE(i) = MSE(i) + ((x_ap3(r)-x_cal(r)).^2);
end   
MSE(i)=(1/10001)*MSE(i);
i=i+1;

for r=1:10001
        MSE(i) = MSE(i) + ((x_ap4(r)-x_cal(r)).^2);
end    
MSE(i)=(1/10001)*MSE(i);
i=i+1;       

MSE(1)
MSE(2)
MSE(3)
MSE(4)

figure(6);
plot(MSE);
grid on;
legend("MSE 1-2-3-4");


