clc;clear all;close all;
% load sunspot.dat
%  year=sunspot(:,1);
% relNums=sunspot(:,2);
% figure;plot(year,relNums)
% title('Sunspot Data')
%  plot(year(1:50),relNums(1:50),'b.-');

M=512;
w0=5.2*2*pi/M;
samples=0:M-1;
for n=1:length(samples)
   relNums(n)=5*cos(w0*samples(n) +1)+ 2*cos(2*w0*samples(n) +2) +...
       3*cos(5*w0*samples(n) + 3); 
end
 
 yfft = fft(relNums);%figure;plot(ifft(yfft)-data1d,'r')
 %yfft = fft(data1d);   iyfft=ifft(yfft);
 [sum(relNums)  yfft(1)]
 yfft(1)=[];  % we grid rid of the first value as it corresponeding to   zero frequency.
 N=length(yfft)+1;
 yfft=yfft.*2./N;
 %%
 power_fft = abs(yfft);power1_fft = sqrt(yfft.*conj(yfft));
 figure;plot(power_fft,'-b');hold on;plot(power_fft,'rO')

 ang_fft = angle(yfft);real_fft= real(yfft);imag_fft= imag(yfft);
 figure;plot(real_fft);hold on;plot(imag_fft,'-r')
 figure;plot(angle(yfft))
  ph = (180/pi)*unwrap(ang_fft); % phase in degrees

 % Now the total length of the per and all other powers should be N-1 because there is no
 % more corresponding poweres and phases, and the number of frequencies before the nequiest is 
   Nneq=length(N./(1:N/2));

    Nm1=N-1;  per=N./(1:Nm1);   freq=1./per;
  %[per'/12   power_fft(1:Nm1)/100 ] % so as to display the period in years

  %% ytyt
  ndat=length(relNums);
  x=0:ndat-1;
  sumharmony1(1:Nneq,1:ndat)=0;
  sumharmony2(1:Nneq,1:ndat)=0;

  for i=1:Nneq
   % those two forms are equal, the last one is called the cos form.
    %     sumharmony1(i,:)=sumharmony1(i,:)+real_fft(i)*cos(2*pi*x/(per(i)))-   imag_fft(i)*sin(2*pi*x/(per(i)));
    sumharmony1(i,:)=sumharmony1(i,:)+power_fft(i)*cos(2*pi*x./(per(i))+ang_fft(i));

  end
   y1 =sum(relNums)/N+ sum(sumharmony1);
   %y2 =sum(tmp)/N+ sum(sumharmony2);

  figure;plot(relNums);hold on; plot( y1, 'r');
 figure;plot((relNums-y1')) % However, the excellent results, we couldnot yet reach to the that of the built in function ifft.
  figure;plot(relNums(1:M),'-ob');hold on; plot( y1(1:M), 'r');
   % note that we multiply by 2 because of using the window hanning.enter code here