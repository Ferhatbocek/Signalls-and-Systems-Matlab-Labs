clc;
Fs=5000;
f1=500;
t=linspace(-1,1,Fs*(0.1));
xt = (sin(2*pi*f1*t))

xt1 = xt/(pi*t)
Xjw = abs(fft(xt));
subplot(1,2,1)
plot(t,xt);

subplot(1,2,2);
f = linspace(-Fs/2,Fs/2,length(xt));
plot(f,Xjw);






% clc;
% 
% Fs=5000;
% f1=50;
% f2=200;
% f3=500;
% t=linspace(-0.05,0.05,Fs*(0.1));
% 
% xt = 0.1*sin(2*pi*f1*t) + 0.5*cos(2*pi*f2*t) - 0.9*sin(2*pi*f3*t);
% f = linspace(-Fs/2,Fs/2,length(xt));
% xf = abs(fft(xt,length(f)));
% xf = fftshift(xf);
% xff = xf/max(xf);
% figure
% 
% subplot(1,2,1);
% plot(t,xt);
% grid on;
% xlabel('time (s)')
% ylabel('x(t)')
% subplot(1,2,2)
% plot(f,xff);
% axis([-1000 1000 0 1.2])
% xlabel('frequency (Hz)')
% ylabel('|X(f)|')
% grid on;
% 
% %lowpass
% [bl al] = butter(1,75/(Fs/2),'low');
% lowfilt1 = filter(bl,al,xt);
% [bl1 al1] = butter(7,75/(Fs/2),'low');
% lowfilt7 = filter(bl1,al1,xt);
% %highpass
% [bh ah] = butter(1,350/(Fs/2),'high');
% highfilt1 = filter(bh,ah,xt);
% [bh1 ah1] = butter(7,350/(Fs/2),'high');
% highfilt7 = filter(bh1,ah1,xt);
% %bandpass
% [bp ap] = butter(1,[75/(Fs/2) 350/(Fs/2)],'bandpass');
% band1 = filter(bp,ap,xt);
% [bp1 ap1] = butter(7,[75/(Fs/2) 350/(Fs/2)],'bandpass');
% band7 = filter(bp1,ap1,xt);
% 
% %9.6
% 
% figure
% subplot(3,1,1)
% h1=freqz(bl,al,Fs/2);
% plot(abs(h1));
% axis([0 1000 0 1.1]);
% grid on
% hold on
% h2=freqz(bl1,al1,Fs/2);
% plot(abs(h2));
% xlabel('frequency(Hz)');
% ylabel('Magnitude (dB)')
% legend('n=1','n=7');
% subplot(3,1,2)
% h3=freqz(bh,ah,Fs/2);
% plot(abs(h3));
% axis([0 1000 0 1.1]);
% grid on
% hold on
% h4=freqz(bh1,ah1,Fs/2);
% plot(abs(h4));
% xlabel('frequency(Hz)');
% ylabel('Magnitude (dB)')
% axis([0 1000 0 1.1]);
% legend('n=1','n=7');
% subplot(3,1,3)
% h5=freqz(bp,ap,Fs/2);
% plot(abs(h5));
% axis([0 1000 0 1.1]);
% grid on
% hold on
% h6=freqz(bp1,ap1,Fs/2);
% plot(abs(h6));
% xlabel('frequency(Hz)');
% ylabel('Magnitude (dB)')
% legend('n=1','n=7');
% 
% %9.7
% 
% figure
% 
% subplot(4,1,1);
% Xf1 = abs(fft(xt));
% Xf1 = fftshift(Xf1);
% plot(f,Xf1/max(Xf1));
% xlabel('frequency(Hz)');
% ylabel('Magnitude (dB)');
% legend('|X(f)|');
% grid on
% subplot(4,1,2);
% Ylpf = abs(fft(lowfilt7));
% Ylpf = fftshift(Ylpf);
% plot(f,Ylpf/max(Ylpf));
% xlabel('frequency(Hz)');
% ylabel('|Ylpf(f)|');
% grid on
% subplot(4,1,3);
% Yhpf = abs(fft(highfilt7));
% Yhpf = fftshift(Yhpf/max(Yhpf));
% plot(f,Yhpf);
% xlabel('frequency(Hz)');
% ylabel('|Yhpf(f)|');
% grid on
% subplot(4,1,4);
% Ybpf = abs(fft(band7));
% Ybpf = fftshift(Ybpf);
% plot(f,Ybpf/max(Ybpf));
% xlabel('frequency(Hz)');
% ylabel('|Ybpf(f)|');
% grid on
% 
% 
