function [time, x, good] = anomaly_detection(x_real,x_prediction) 
    % the inputs should have the same length
    thr=0.11;
    j=1;    
    for  i=1:length(x_real)
       if(abs(x_real(i)-x_prediction(i))>thr) 
            time(j)=i;
            x(j)=x_real(i);
            j=j+1;
       end
    end
    figure(1)
    plot(x_real);
    hold on
    plot(x_prediction);
    scatter(time, x);

    for i=1:length(time)
        x_real(time(i))=x_prediction(time(i));
    end
    figure(2)
    plot(x_real);
end