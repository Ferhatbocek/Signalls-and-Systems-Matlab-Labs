clc
%part a
T=4;
Fs = 10000;
t=0:(1/Fs):4;
Fc = 10;
t1=0:(1/Fs):1.9999; 
t2=2:(1/Fs):4;

x1 = 3 + t1*0;
x2 = sin(2*pi*Fc*t2);
xt = [x1 x2];
plot(t,xt);
xlabel("t");
ylabel('x(t)');
legend('x(t)');
grid on;
axis([0 4 -2 4]);

%part 2
w=2*pi/T;
dt=1/Fs;
coef = zeros(1,2001);
k=-1000;
for i=1:2001
    %t0=0;
    for x=1:40001
        
        coef(i) = coef(i) + xt(x)*(exp(-1j*k*w*t(x)))*dt;
        %t0=t0+dt;
    end 
    coef(i) = coef(i)/T;
k=k+1;
end
coef;
%part 3

b=0;
for i=1:2001

    b = b + (abs(coef(i))).^2;

end    

%part 4
c=0;
for x=1:40001

    c = c + (abs(xt(x)).^2)*dt;

end    

c = c*(1/T);

b
c





























































