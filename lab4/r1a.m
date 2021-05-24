function [a, x_predicted, r] = r1a(x_train,N)
    sum1=0;
    sum2=0;
    for i=1:length(x_train)-N
       sum1=sum1 + x_train(i)*x_train(i+N);
       sum2=sum2 + (x_train(i))^2; 
    end
    a=sum1/sum2;

    for i=1:length(x_train)-N
        x_predicted(i)=a*x_train(i); 
    end
    
    for i=1:length(x_train)-N
        r(i)=x_train(i+N)-a*x_train(i); 
    end
    
    
end

