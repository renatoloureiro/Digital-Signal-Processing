clc;
clear;

load('energy_train.mat');
N=96;

%% R1a) R1b)

[a, x_predicted, r] = r1a(x_train,N);


%Plot da training data, da prediction e do residuo correspondente

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


% Energia do residuo
energy_r = energy(r);

%% R1d)

%Definir P

P = 6;

%Calculo coeficientes

a_r = calc_coef(r,P);

%% R1e)
%r_predicted = r(1:P);
r_predicted(1:length(r)-P) = 0; %Not sure

for n=1:length(r)-P
    for k=1:P
        r_predicted(n) = r_predicted(n) + a_r(k)*r(n+P-k);
    end
end

x_new_predicted=x_predicted(P+1:length(x_predicted)) + r_predicted;


%Calculo do residuo

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











