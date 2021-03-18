% ************************************************************************
%                       Digital Signal Processing
% lab1 - Sampling and Aliasing
% authors: Renato Loureiro & Miguel Felix
% ************************************************************************

% Global par
    listen=1;
    spect=0;

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
    
    if listen==1
        soundsc(x,fs);
        pause(5);
    end
    
    if spect==1
        figure(1) 
        N=32*2; %maybe 8 is good
        spectrogram(x,hann(N),3*N/4,4*N,fs,'yaxis');
    end
    
% generate signal y with a frequency of half 

    for i=1:length(x)/2
       y(i)=x(2*i); 
    end
    if listen==1
        soundsc(y,fs/2);
        pause(5);
    end
    if spect==1
        figure(2)
        N=32*2; %maybe 8 is good
        spectrogram(y,hann(N),3*N/4,4*N,fs/2,'yaxis');
    end

%% analyse the mp3 file

    [z,Fs]=audioread('romanza_pe.wav');
    if listen==1
        soundsc(z,Fs);
        pause(15);
        clear sound
    end
    z1=z(1:Fs*15);
    if spect==1
        N=32*64*2;
        figure(3)
        spectrogram(z1,hann(N),3*N/4,4*N,Fs,'yaxis');
    end
    
% sample the signal so it has a sampling rate of Fs/5

    for i=1:length(z)/5
        z2(i)=z(5*i);
    end
    z2=z2(1:(Fs/5)*10); % the signal only has information regarding ...
                        % the first 10 seconds
    if listen==1                    
        soundsc(z2,Fs/5);
        pause(10);
        clear sound
    end
    if spect==1
        N=32*16;
        figure(4)
        spectrogram(z2,hann(N),3*N/4,4*N,Fs/5,'yaxis');
    end
    
% signal filtering

    zf=filter(fir1(100,0.2),1,z);
    
    if listen==1
        soundsc(zf,Fs);
        pause(15);
        clear sound
    end
    
    if spect==1
        N=32*16;
        figure(5)
        spectrogram(zf(1:Fs*15),hann(N),3*N/4,4*N,Fs,'yaxis');
    end
    
    
    for i=1:length(zf)/5
        zf2(i)=zf(i*5);
    end
    if listen==1
        soundsc(zf2,Fs/5);
        pause(15);
        clear sound
    end

    if spect==1
        N=32*16;
        figure(6)
        spectrogram(zf2(1:(Fs/5)*15),hann(N),3*N/4,4*N,Fs/5,'yaxis');
    end

