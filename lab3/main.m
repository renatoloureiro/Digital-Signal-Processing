[y,Fs]=audioread('fugee.wav');
%soundsc(p(1:100000),Fs)

figure(1)
plot((1:100000)/Fs,y(1:100000))
y_fft=fft(y(1:100000));
y_abs_fft=abs(y_fft);
%semilogy(y_abs_fft)

Wn=0.5;
N=10;
[B,A]=butter(N,Wn);
[h,w]=freqz(B,A);
%semilogy(abs(h))

z=filter(B,A,y(1:100000));
soundsc(z,Fs)
%plot(abs(fft(z)))
figure(2)
plot(z)

z=medfilt1(y(1:100000),5)
plot(z)
soundsc(z,Fs)
plot(abs(fft(z)))