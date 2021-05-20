load('energy_train.mat');
N=96;

%% R1a)

a = r1a(x_train,N);

%% R1b)

%Prediction

i=N+1;
aux=x_train(1:N);
while(i<=length(x_train))
   aux(i)=a*x_train(i-N);
   i=i+1;
end

%Plot da training data, da prediction e do residuo correspondente

%% R1c)
%Calculo do residuo
i=1;
while(i<length(x_train)-N)
   r(i)=x_train(i+N)-a*x_train(i);
   i=i+1; 
end

% Energia do residuo
energy_r = energy(r);

%% R1d)

%Definir P

P = 6;

%Calculo coeficientes

[a_r,H] = calc_coef(r,P);

%% R1e)

% Previsão de r

r_predicted = H*a_r;

%Calculo do residuo
e = r' - r_predicted;

%% R1f)

% Energia do residuo
energy_e = energy(e);
