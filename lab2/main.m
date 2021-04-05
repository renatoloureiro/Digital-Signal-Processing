% R1.a)
M=512;
w0=5.2*2*pi/M;
samples=0:M-1;
for n=1:length(samples)
   x(n)=5*cos(w0*samples(n) +1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3); 
end

% R1.b)
plot(samples,x);

% R1.c)
N=512;
dfourier=fft(x);
fs=1;
f=fs*(0:N/2)/N;
figure()
plot(f,abs(dfourier(1:512/2 +1)/512))
figure()
plot(f,angle(dfourier(1:512/2 +1)/512))

% R1.d)
% determine the 3 maximum in the vector and its indices
[sortedv, indices] = sort(abs(dfourier(1:512/2 +1)/512), 'descend');
max3=sortedv(1:3);
ind3=indices(1:3);
freq3=[f(ind3(1)),f(ind3(2)),f(ind3(3))];





