function a = r1a(x_train,N)
i=1;
sum1=0;
sum2=0;
while(i<length(x_train)-N)
   sum1=sum1 + x_train(i)*x_train(i+N);
   sum2=sum2 + (x_train(i))^2; 
   i=i+1; 
end
a=sum1/sum2;
end

