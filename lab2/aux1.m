[p,Fs]=audioread('How_many_roads.wav');
N=length(p);
samples=0:N-1;
f=(0:N/2-1)./N;
yfft=fft(p);
abs_yfft=abs(yfft);
angle_yfft=angle(yfft);

z=zeros(1,N);
n=1:N;
%%
z=zeros(1,N);
n=1:N;
peaks=[ 5,  1174.68,    1.66111;
        10, 402.815,    -2.86734;
        26, 757.183,    3.02112];
for i=1:length(peaks)
    z=z+(2/N)*(peaks(i,2)*cos(2*pi*n*peaks(i,1)/N + peaks(i,3)));
end
plot(samples,z)


%%
S_min=[25,15,10,5,2,1,0.5,0.25,0.1];
%[1.7869,4.096843,6.335359,15.187985,25.391269,46.961983,93.172506,130.850029,187.719489]

z=zeros(1,N);
%for j=1:length(S_min)
    %tic
    counter=0;
    j=3;
    for i=1:N/2
        if abs_yfft(i)>S_min(j) % 10 it makes possible to hear 
            z=z + (1/N)*2*abs_yfft(i)*cos(2*pi*i*n/N + angle_yfft(i));
            counter=counter+1;
        end
    end
    %aux(j)=toc;
%end

%%
S_min=[25,15,10,5,2,1,0.5,0.25,0.1];
S_time=[1.7869,4.096843,6.335359,15.187985,25.391269,46.961983,...
    93.172506,130.850029,187.719489];
%scatter(S_min,S_time, 'filled')
figure()
xBox=[10,10,25,25,10];
yBox=[0,200,200,0,0];
hold on
p=patch(xBox, yBox, 'black', 'FaceColor', 'red', 'FaceAlpha', 0.25);
p.EdgeColor='none';
xBox=[10,10,0,0,10];
yBox=[0,200,200,0,0];
p=patch(xBox, yBox, 'black', 'FaceColor', 'green', 'FaceAlpha', 0.25);
p.EdgeColor='none';
scatter(S_min,S_time, 'filled')


