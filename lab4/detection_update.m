function [x, anom_time, anom_value]=detection_update(x, N)

    %using the long term model
    a=0.980970737274931;
    thr=0.13;
    k=1;
    for j=0:round(length(x)/N)-3
        for i=1:N
            prediction(i)=a*x(i + j*N);
            error=abs(prediction(i) - x(i + (j+1)*N));
            if error>thr
                disp("anomalie detected");
                anom_time(k)=i + (j+1)*N;
                anom_value(k)=x(i + (j+1)*N);
                x(i + (j+1)*N)=prediction(i);
                k=k+1;
            end
        end
    end
    
    

end