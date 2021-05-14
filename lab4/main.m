load('energy_train.mat');
N=96;

i=1;
sum1=0;
sum2=0;
while(i<length(x_train)-N)
   sum1=sum1 + x_train(i)*x_train(i+N);
   sum2=sum2 + (x_train(i))^2; 
   i=i+1; 
end
a=sum1/sum2;

i=N+1;
aux=x_train(1:96);
while(i<=length(x_train))
   aux(i)=a*x_train(i-N);
   i=i+1;
end

% calculate residue
i=1;
while(i<length(x_train)-N)
   r(i)=x_train(i+N)-a*x_train(i);
   i=i+1; 
end

P=6;






