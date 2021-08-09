clc;
clear;

load('energy_train.mat');
N=96;

%% R1a) R1b)

[a, x_predicted, r] = r1a(x_train,N);


%Plot da training data, da prediction e do residuo correspondente

<<<<<<< HEAD
figure();
plot(x_train);
hold();
plot(N+1:length(x_train),x_predicted);
xlabel("Amostras");
ylabel("Amplitude");
legend("Training Data (x\_train(t))", "Previsão (x\_predicted)");

figure();
plot(r);
xlabel("Amostras");
ylabel("Amplitude");
legend("Resíduo (r(t))");

%% R1c)

=======
i=N+1;
x_predicted1=x_train(1:N);
while(i<=length(x_train))
   x_predicted1(i)=a*x_train(i-N);
   i=i+1;
end

%Calculo do residuo
i=1;
while(i<length(x_train)-N)
   r(i)=x_train(i+N)-a*x_train(i);
   i=i+1; 
end
>>>>>>> c3acaa3ecf922a74578645c2f19aa4dec871b38c

%Plot da training data, da prediction e do residuo correspondente

plot(x_train)
title('Training Data')
figure;
plot(r)
title('Resíduo r(n)')
figure;
plot(x_train)
hold on
plot(x_predicted1)
legend('Training Data','Previsão')

%% R1c)

% Energia do residuo
energy_r = energy(r);

%% R1d)

%Definir P

P = 6;

%Calculo coeficientes

[a_r,H] = calc_coef(r,P);

%% R1e)
<<<<<<< HEAD
%r_predicted = r(1:P);
r_predicted(1:length(r)-P) = 0; %Not sure

for n=1:length(r)-P
    for k=1:P
        r_predicted(n) = r_predicted(n) + a_r(k)*r(n+P-k);
    end
end
=======

% Previsão de r

r_predicted = H*a_r;
>>>>>>> c3acaa3ecf922a74578645c2f19aa4dec871b38c

x_new_predicted=x_predicted(P+1:length(x_predicted)) + r_predicted;


%Calculo do residuo
<<<<<<< HEAD

e=x_train(N+P+1:length(x_train))-x_new_predicted';

figure();
plot(x_train);
hold();
plot(N+1+P:length(x_train),x_new_predicted);
xlabel("Amostras");
ylabel("Amplitude");
legend("Training Data (x\_train(t))", "Nova Previsão (x\_new\_predicted)");

figure();
plot(e);
xlabel("Amostras");
ylabel("Amplitude");
legend("Resíduo (e(t))");

%% R1f)

%Calculo coeficientes

% Energia do residuo
energy_e = energy(e);

%% 

clear;
load('energy_test.mat');
N=96;

[a, x_predicted, r] = r1a(x_test,N);
anomaly_detection(x_test(N+1:length(x_test)), x_predicted);

P = 6;
a_r = calc_coef(r,P);
r_predicted(1:length(r)-P) = 0; %Not sure

for n=1:length(r)-P
    for k=1:P
        r_predicted(n) = r_predicted(n) + a_r(k)*r(n+P-k);
    end
end
x_new_predicted=x_predicted(P+1:length(x_predicted)) + r_predicted;

%anomaly_detection(x_test(N+1+P:length(x_test)), x_new_predicted);








=======
e = r' - r_predicted;

% plot(e)
% title('Resíduo e(n)')
% figure;

x_predicted2 = x_predicted1 + r_predicted;
>>>>>>> c3acaa3ecf922a74578645c2f19aa4dec871b38c

plot(x_train)
hold on
plot(x_predicted2)
legend('Training Data','Prediction')
figure;

%% R1f)

