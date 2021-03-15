% ****************************************
%        Digital Signal Processing
% lab1 - Sampling and Aliasing
% authors: Renato Loureiro & Miguel Felix
% ****************************************

% ************* Part 1 *******************

% Sampling definition
fs=8000; % sampling frequency
Ts=1/fs; % sampling time 

% define interval
    tb=0;
    tf=2;
    t=0:Ts:2;

% sample chirp signal with fs
k2=1000;
k1=0;
F0=0;
phi0=0;
x=cos(2.*pi.*((1./3).*k2.*t.^3 + 0.5.*k1.*t.^2 + F0.*t + phi0));

%soundsc(x,fs);

N=32*2; %maybe 8 is good
spectrogram(x,hann(N),3*N/4,4*N,8000,'yaxis');








