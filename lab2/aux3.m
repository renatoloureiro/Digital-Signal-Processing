[p,Fs]=audioread('How_many_roads.wav');
M=2048;
seg=p(48500:48500+M-1);
N=length(seg);
samples=0:N-1;
f=(0:N/2-1)./N;
yfft=fft(seg);
abs_yfft=abs(yfft);
angle_yfft=angle(yfft);

z=zeros(1,N);
n=1:N;
peaks=[ 6,  18.8942,    -0.605427;
        12, 11.3209,    -0.438403;
        18, 7.52433,    -2.6141];
for i=1:length(peaks)
    z=z+(2/N)*(peaks(i,2)*cos(2*pi*n*peaks(i,1)/N + peaks(i,3)));
end
plot(samples,z)
xlabel("amostras")
