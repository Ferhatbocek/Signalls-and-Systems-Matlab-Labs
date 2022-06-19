clear;
clear all;
clc;

n=0:1:50;
x=(0.5).*(n==0)+2.*(n==1);
h1=((-0.5).^n).*heaviside(n+0.5);
h2=heaviside(n+0.5)-heaviside(n-3.5);

subplot(3,1,1);
stem(n,x,'-r');
title("x");
ylabel("Amplitude"),xlabel("n");
legend("x[n]");
subplot(3,1,2);
stem(n,h1,'-k');
title("h1");
ylabel("Amplitude"),xlabel("n");
legend("h1");
subplot(3,1,3);
stem(n,h2,'-b');
title("h2");
ylabel("Amplitude"),xlabel("n");
legend("x[n]");

n=0:1:50;
x=(0.5).*(n==0)+2.*(n==1);
h1=((-0.5).^n).*heaviside(n+0.5);
h2=heaviside(n+0.5)-heaviside(n-3.5);


a=Ferhat_bocek_conv(x,h1)
y1=Ferhat_bocek_conv(a,h2)

b=Ferhat_bocek_conv(h1,h2)
y2=Ferhat_bocek_conv(x,b)

c=Ferhat_bocek_conv(h2,h1)
y3=Ferhat_bocek_conv(x,c)

d=Ferhat_bocek_conv(x,h2)
y4=Ferhat_bocek_conv(d,h1)


figure(2);
subplot(2,2,1);
stem(y1,'k')(1:21);
title("y1[n]");
ylabel("Amplitude");
xlabel("n");
legend("y1[n]");


subplot(2,2,2);
stem(y2,'r')(1:21);
title("y2[n]");
ylabel("Amplitude");
xlabel("n");
legend("y2[n]");


subplot(2,2,3);
stem(y3,'b')(1:21);
title("y3[n]");
ylabel("Amplitude");
xlabel("n");
legend("y3[n]");


subplot(2,2,4);
stem(y4,'g')(1:21);
title("y4[n]");
ylabel("Amplitude");
xlabel("n");
legend("y4[n]");

