<<<<<<< HEAD
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
=======
%% Escolhas e inicialização
clc;
clear;

plotting = 0;
listening = 1;

%% Ler o sinal audio
%R1a)
[x,Fs]=audioread('fugee.wav');
if listening == 1
    soundsc(x,Fs);
    pause(10);
    clear sound;
end

%R1b)
t = 0:1/Fs:length(x)/Fs; %Tempo "amostrado" de 1/Fs em 1/Fs segundos
t(1) = []; %Vectores x e t ficarem do mesmo tamanho

if plotting == 1
    figure();
    plot(t,x); %Plot do sinal audio ao longo do tempo
    figure();
    plot(t(10*Fs:25*Fs),x(10*Fs:25*Fs));%Plot de segmento do sinal
    figure();
    plot(t(110*Fs:125*Fs),x(110*Fs:125*Fs));%Plot de segmento do sinal
    %%figure();
    %%plot(t(110*Fs:111*Fs),x(110*Fs:111*Fs));%Plot de segmento do sinal
end

%R1c)

%FFT
yfft = fft(x);
abs_yfft=abs(yfft);

%Plot magnitude fft escala logaritmica
norm_f = 0:2*pi/length(yfft):2*pi;
norm_f(1)=[];
figure();
semilogy(norm_f,abs_yfft);

%% Filtrar com LTI

%R2a)
n_bw = 10;
Wn = 0.5; %Check this
[b,a] = butter(n_bw,Wn); %Obter os coefecientes do filtro de Butterworth
[h,w]=freqz(b,a); %Resposta filtro

figure(); %Check this
plot(w,abs(h)); %Plotar linearmente h

%R2b)

xf_bw = filter(b,a,x);

%R2c)
figure();
plot(t,xf_bw);
hold();
plot(t,x);

figure();
plot(t(10*Fs:11*Fs),x(10*Fs:11*Fs));%Check this (escolher intervalo)
hold();
plot(t(10*Fs:11*Fs),xf_bw(10*Fs:11*Fs));

%R2d)

%FFT filtrado
yfft_bw = fft(xf_bw);
abs_yfft_bw=abs(yfft_bw);

%Plot magnitude fft escala logaritmica
figure();
semilogy((0:length(abs_yfft)-1)*2*pi/(length(abs_yfft)-1),abs_yfft);
hold();
semilogy((0:length(abs_yfft_bw)-1)*2*pi/(length(abs_yfft_bw)-1),abs_yfft_bw);

%R2e)

if listening == 1
    soundsc(xf_bw,Fs);
    pause(10);
    clear sound;
end

%R2f)

%% Filtrar com Median

%R3b)
n_m=4;
xf_m = medfilt1(x,n_m);

figure();
plot(t,xf_m);
hold();
plot(t,x);

figure();
plot(t(10*Fs:11*Fs),x(10*Fs:11*Fs));%Check this (escolher intervalo)
hold();
plot(t(10*Fs:11*Fs),xf_m(10*Fs:11*Fs));

%R3c)

%FFT filtrado
yfft_m = fft(xf_m);
abs_yfft_m=abs(yfft_m);

%Plot magnitude fft escala logaritmica
figure();
semilogy((0:length(abs_yfft)-1)*2*pi/(length(abs_yfft)-1),abs_yfft);
hold();
semilogy((0:length(abs_yfft_bw)-1)*2*pi/(length(abs_yfft_bw)-1),abs_yfft_m);

%R3d)

if listening == 1
    soundsc(xf_m,Fs);
    pause(10);
    clear sound;
end

%R3e) tentar com outras ordens
>>>>>>> af116b54cdc63be682f3215fe9a107f6a42e24ad
