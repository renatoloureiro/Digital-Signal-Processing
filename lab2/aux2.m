N=2*512;
w0=5.2*2*pi/N;
samples=0:N-1;
for n=1:length(samples)
    if n<N/2
    x(n)=5*cos(w0*samples(n) +1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3);
    else
    x(n)=0;    
    end

end
figure()
    plot(samples, x);
    xlabel("amostras");   
yfft=fft(x);
abs_yfft=abs(yfft);     angle_yfft=angle(yfft);
f=(0:N/2-1)./N;

figure()
    plot(f,abs_yfft(1:N/2));
    xlabel("frequencia [Hz]");  ylabel("Magnitude");

figure()

    plot(f,angle_yfft(1:N/2));
    xlabel("frequencia [Hz]");  ylabel("Angulo [rad]");

z=zeros(1,N);
n=1:N;
for i=1:N/2
    z=z + (1/N)*2*abs_yfft(i)*cos(2*pi*i*n/N + angle_yfft(i));
end