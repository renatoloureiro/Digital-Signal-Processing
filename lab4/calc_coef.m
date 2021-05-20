%% R1d)

function a_r = calc_coef(r,P)
    for i=1:P
        for k=1+P:length(r)
        H(k,i)=r(k-i);
        end
    end
    a_r = inv(H'*H)*H'*r';
end