function energy = energy(r)
energy = 0;
    for k=1:length(r)
        energy= r(k)^2 + energy;
    end
end

