% R1.a)
M=512;
w0=5.2*2*pi/M;
samples=0:M-1;
for n=1:length(samples)
   x(n)=5*cos(w0*samples(n) +1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3); 
end
N=32;
Fs=1000;
figure()
spectrogram(x,hann(N),3*N/4,4*N,Fs,'yaxis');

soundsc(x,1000)
%% R1.b)
plot(samples,x);

% R1.c)
N=512;
dfourier=fft(x);
fs=1;
f=fs*(0:N/2)/N;
figure()
plot(f,abs(dfourier(1:M/2 +1)/M))
figure()
plot(f,angle(dfourier(1:M/2 +1)/M))

% R1.d)
% determine the 3 maximum in the vector and its indices
[sortedv, indices] = sort(abs(dfourier(1:512/2 +1)/512), 'descend');
max3=sortedv(1:3);
ind3=indices(1:3);
freq3=[f(ind3(1)),f(ind3(2)),f(ind3(3))];

% recontruct the initial function from the fourier transform
for i=1:M % x(i)
   z(i)=0;
    for j=1:N/2
        if j== ind3(1) || j== ind3(2) || j== ind3(3) 
            z(i)= z(i) + 2*dfourier(j)*exp(1i*2*pi*j*i/N);   
        end
    end
end
% o problema parace ser o ganho/escala


% R1.e)
% just do a plot

% R1.f)
% do with N=1024


% ---------------------------------------
% R2.a)
[p,Fs]=audioread('How_many_roads.wav');
% soundsc(p,Fs);

% R2.b) % get segment from sample 48500
seg=p(48500:length(p));
N=64*2;
%spectrogram(seg,hann(N),3*N/4,4*N,Fs,'yaxis');
%soundsc(seg,Fs)
aux=fft(seg);
figure()
f=(0:length(aux)/2)/length(aux);
plot(f,abs(aux(1:length(aux)/2 +1)/length(aux)));

% R2.c)



