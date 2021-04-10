[p,Fs]=audioread('How_many_roads.wav');
N=length(p);
yfft=fft(p);
abs_yfft=abs(yfft);
angle_yfft=angle(yfft);

z=zeros(1,N);
n=1:N;
%%
S_min=[15,10,5,2,1,0.5,0.25,0.1, 0.05];
%[4.096843,6.335359,15.187985,25.391269,46.961983,93.172506,130.850029,187.719489,256.586106]

z=zeros(1,N);
for j=1:length(S_min)
    tic
    for i=1:N/2
        if abs_yfft(i)>S_min(j) % 10 it makes possible to hear 
            z=z + (1/N)*2*abs_yfft(i)*cos(2*pi*i*n/N + angle_yfft(i));
        end
    end
    aux(j)=toc;
end