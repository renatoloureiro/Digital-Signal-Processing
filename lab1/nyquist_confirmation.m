% this .m file is for comapring diferent input sinusoidal signal with the
% respective frequency
flag.spect=0;
flag.print=0;

fi=[1,3,5,15]*10^3; % input frequency
fs=[4, 8, 20]*10^3; % sampling frequency
N=100;
for j=1:length(fs)
t=0:(1/fs(j)):(10/fs(j));
    for i=1:length(fi)
        z=cos(2.*pi.*fi(i).*t);
        figure()
        plot(t,z,'.');
        %spect_creation(flag.spect,flag.print, N, fs(j), z, ...
        %    join(['spect_fi', num2str(fi(i)/10^3),'_fs', num2str(fs(j)/10^3)]));
        clear z;
    end
end

% -----------------------------------------------------------------------
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