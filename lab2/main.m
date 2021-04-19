% R1.a)
N=512;  w0=5.2*2*pi/N;  samples=0:N-1;
for n=1:length(samples)
    x(n)=5*cos(w0*samples(n) + 1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3);
end


%% R1.b)
plot(samples,x);
xlabel("amostras")
%% R1.c)
%N=512;
yfft=fft(x);
abs_yfft=abs(yfft);
angle_yfft=angle(yfft);
f=(0:N/2-1)./N;
figure()
    plot(samples(1:N/2),abs_yfft(1:N/2));
    xlabel("Frequency [Hz]");   ylabel("Magnitude");
figure()
    plot(samples(1:N/2),angle_yfft(1:N/2));
    xlabel("Frequecy [Hz]");    ylabel("Angle [rad]");

%% R1.d)

z=zeros(1,N);
n=1:N;
peaks=[ 5,  1174.68,    1.66111;
        10, 402.815,    -2.86734;
        26, 757.183,    3.02112];
for i=1:length(peaks)
    z=z+(2/N)*(peaks(i,2)*cos(2*pi*n*peaks(i,1)/N + peaks(i,3)));
end
plot(samples,z)
xlabel("amostras")

%% R1.e)
figure()
    plot(samples,x);
    hold on
    plot(samples,z);
    xlabel("amostras");
    legend("Sinal original", "Sinal reconstruido");


%% R1.f)
N=2*512;
w0=5.2*2*pi/512;
samples=0:N-1;
for n=1:length(samples)
    if n<N/2
    x(n)=5*cos(w0*samples(n) +1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3);
    else
    x(n)=0;    
    end
end


yfft=fft(x);
abs_yfft=abs(yfft);     angle_yfft=angle(yfft);
f=(0:N/2-1)./N;
z=zeros(1,N);
n=1:N;
peaks=[ 10,  1192.15,    1.33341;
        21, 368.903,    1.03408;
        52, 740.565,    3.02683];
for i=1:length(peaks)
    z=z+(2/N)*(peaks(i,2)*cos(2*pi*n*peaks(i,1)/N + peaks(i,3)));
end
plot(samples/2,z)
xlabel("amostras")
    




