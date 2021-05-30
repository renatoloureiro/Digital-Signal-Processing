clear;
clc;

%% R1a) - Puramente teórica

%% R1b)

load('sar_image.mat');

imagesc(I);
colormap(parula(200));

%Just to compare and test colormap function

% figure();
% imagesc(I);
% colormap(parula(2)); 

% figure();
% imagesc(I);
% colormap summer;

%% R1c)

[J,rect] = imcrop(I);

