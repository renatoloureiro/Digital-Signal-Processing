%% R1d)

function [a_r,H] = calc_coef(r,P)
    for i=1:P
        for k=1+P:length(r)
            H(k,i)=r(k-i);
        end
    end
<<<<<<< HEAD
    disp(length(H));
=======
>>>>>>> c3acaa3ecf922a74578645c2f19aa4dec871b38c
    a_r = inv(H'*H)*H'*r';
end