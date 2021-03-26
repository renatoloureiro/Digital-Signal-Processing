% ************************************************************************
%                       Digital Signal Processing
% lab1 - Sampling and Aliasing
% authors: Renato Loureiro & Miguel Felix
% ************************************************************************

% flags
    flag.listen=0;      flag.spect=0;
    flag.plot_3c=0;     flag.print=1;
    
% Sampling definition
    fs=8000; % sampling frequency
    Ts=1/fs; % sampling time 

% define interval
    t_limits=[0,2];
    t=t_limits(1):Ts:t_limits(2);

% sample chirp signal with fs
    k=[0, 1000, 0, 0]; % [k1, k2, F0, phi0]
    x=cos(2.*pi.*((1./3).*k(2).*t.^3 + 0.5.*k(1).*t.^2 + k(3).*t + k(4)));
    
    time_sound=5;
    hear_sound(flag.listen, fs, x, time_sound)
    
    N=32*2; %maybe 8 is good, specify the width of the spectogram
    spect_creation(flag.spect,flag.print, N, fs, x, 'spect_original_N32_2')
    
    
% generate signal y with a frequency of half 

    for i=1:length(x)/2
       y(i)=x(2*i); 
    end
    
    time_sound=5;
    hear_sound(flag.listen, fs/2, y, time_sound)
    
    N=32*4; % specify the width of the spectogram
    %spect_creation(flag.spect,flag.print ,N,fs/2,y,'spect_nyquist_failed')
    

    fs_j=[20]*10^3; %sampling frequencies given
    f_i=[5]*10^3; %4 frequencies choosen by us ESCOLHER AS FREQUENCIAS
    
    if flag.plot_3c==1
        for i=1:length(f_i) %for each choosen frequency
            for j=1:length(fs_j) %for each sampling frequency
                tz=0:1/fs_j(j):1.5*10^-3; %TALVEZ PROLONGAR ESTE TEMPO?
                k=1:length(tz);
                z_signal=cos(2.*pi.*f_i(i).*tz); 
                tt=0:1/(10*fs_j):1.5*10^-3;
                for q=1:length(tt)
                    h=sinc((tt(q) - k./fs_j).*fs_j); % recontruct the continous signal
                    xr(q)=z_signal*h';
                end
                figure
                plot(tt, xr); %plots for each choosen frequency at every sampling frequency
            end
        end 
    end
%% analyse the mp3 file

    [z,Fs]=audioread('romanza_pe.wav');
    
    time_sound=5;
    hear_sound(flag.listen, Fs, z, time_sound)
    
    N=32*64; % specify the width of the spectogram
    spect_creation(flag.spect,flag.print ,N,Fs,z(1:Fs*15),'spect_romanza_orignal')
  
% sample the signal so it has a sampling rate of Fs/5

    for i=1:length(z)/5
        z2(i)=z(5*i);
    end
    z2=z2(1:(Fs/5)*15); % the signal only has information regarding ...
                        % the first 15 seconds
                        
    time_sound=5;
    hear_sound(flag.listen, Fs/5, z2, time_sound)                    

    N=32*16; % specify the width of the spectogram
    spect_creation(flag.spect,flag.print ,N,Fs/5,...
        z2,'spect_romanza_nyquist_failed')
    
% signal filtering

    zf=filter(fir1(100,0.2),1,z);
    
    time_sound=5;
    hear_sound(flag.listen, Fs, zf, time_sound)  
    
    N=32*32; % specify the width of the spectogram
    spect_creation(flag.spect,flag.print ,N,Fs,...
                    zf(1:(Fs)*15),'spect_romanza_filtered')
    
    
    for i=1:length(zf)/5
        zf2(i)=zf(i*5);
    end
    
    time_sound=5;
    hear_sound(flag.listen, Fs/5, zf2, time_sound)  
    
    N=32*32; % specify the width of the spectogram
    spect_creation(flag.spect,flag.print ,N,Fs/5,...
                    zf2(1:(Fs/5)*15),'spect_romanza_filtered&sampled')
                
                

    %------------------------------------------------------------------
    
    function spect_creation(flag1,flag2, N, fs, x, name)
        if flag1==0
            h=figure('visible','off');
            spectrogram(x,hann(N),3*N/4,4*N,fs,'yaxis');
        else
            figHandles = get(groot, 'Children');
            h=figure(length(figHandles) + 1);
            spectrogram(x,hann(N),3*N/4,4*N,fs,'yaxis');
        end
        
        if flag2==1
            set(h,'Units','Inches');
            pos = get(h,'Position');
            set(h,'PaperPositionMode','Auto','PaperUnits','Inches',...
                    'PaperSize',[pos(3), pos(4)]);
            print(h,[pwd join(['/Img/',name])],'-dpdf','-r0');
        end
        if flag1==0
            close(h)
        end
    end
    
    function hear_sound(flag, fs, x, time_sound)
        if flag==1
            if (time_sound<0)
                disp("error in time value for listening\n")
                exit(0)
            end
            soundsc(x,fs);
            dt=length(x)/fs;
            if(dt>time_sound)
                pause(time_sound);
            else
                pause(dt);
            end
            clear sound
        end 
    end
    
    
