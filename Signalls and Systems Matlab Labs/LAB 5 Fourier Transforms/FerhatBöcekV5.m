fs = 5000;
f1=50;
f2=300;
T = 1/fs;
t = linspace(0,0.5,fs/2);
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);
subplot(2,2,1);
plot(t,signal)

freqsig = abs(fft(signal,2500));
subplot(2,2,2);
plot((freqsig))

[b a] = butter(10,100/2500,'low');
filtered = filtfilt(b,a,signal);
subplot(2,2,3);
plot(t,filtered);
subplot(2,2,4);
freqsig1 = abs(fft(filtered,2500));
plot(freqsig1);