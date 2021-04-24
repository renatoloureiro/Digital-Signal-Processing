%% Escolhas e inicialização
clc;
clear;

plotting = 0;
listening = 1;

%% Ler o sinal audio
[x,Fs]=audioread('fugee.wav');
if listening == 1
    soundsc(x,Fs);
    pause(10);
    clear sound;
end

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

%FFT
yfft = fft(x);
abs_yfft=abs(yfft);

%Plot magnitude fft escala logaritmica
figure();
semilogy(abs_yfft);

%% Filtrar com LTI

%R2a)
n_bw = 10;
Wn = 0.25; %Check this
[b,a] = butter(n_bw,Wn); %Obter os coefecientes do filtro de Butterworth
[h,w]=freqz(b,a); %Resposta filtro

figure(); %Check this
plot(w,h); %Plotar linearmente h

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
yfft_bw = fft(x);
abs_yfft_bw=abs(yfft_bw);

%Plot magnitude fft escala logaritmica
figure();
semilogy(abs_yfft);
hold();
semilogy(abs_yfft_bw);

%R2e)

if listening == 1
    soundsc(xf_bw,Fs);
    pause(10);
    clear sound;
end

%R2f)

%% Filtrar com Median

%R3b)
n_m=3;
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
yfft_m = fft(x);
abs_yfft_m=abs(yfft_m);

%Plot magnitude fft escala logaritmica
figure();
semilogy(abs_yfft);
hold();
semilogy(abs_yfft_m);

%R3d)

if listening == 1
    soundsc(xf_m,Fs);
    pause(10);
    clear sound;
end


