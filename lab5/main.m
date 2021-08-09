clear;
clc;

%% R1a) - Puramente teórica

%% R1b)

load('sar_image.mat');

imagesc(I);
%colormap(parula(200));

%Just to compare and test colormap function

% figure();
 %imagesc(I);
 %colormap(parula(2)); 

% figure();
% imagesc(I);
% colormap summer;

%% R1c)

%[I2,rect]=imcrop(imagesc(I))

%----------ICE-----------------------
rect=[0.5100  201.5100  189.9800  170.9800]
I2=imcrop(I,rect);
figure(1);
imagesc(I2)
title('ICE')

%---------Water----------------------
rect=[276.5100    0.5100  365.9800  232.9800];
I3=imcrop(I,rect);
figure(2);
imagesc(I3)
title('OCEAN')

%% ---------ICE---------------------
figure(3)
ice=I2(:);
ice = ice - min(ice(:));
ice = ice ./ max(ice(:));
h=histogram(ice, 'Normalization','probability')

norm_ice = mle(ice,'distribution', 'norm');
exp_ice = mle(ice,'distribution', 'exp');
rayl_ice = mle(ice,'distribution', 'rayl');

y = linspace(0, 1, h.NumBins);
p_norm_ice = normpdf(y, norm_ice(1), norm_ice(2));
p_norm_ice = p_norm_ice./sum(p_norm_ice);

p_rayl_ice = raylpdf(y, rayl_ice);
p_rayl_ice = p_rayl_ice./sum(p_rayl_ice);
p_exp_ice = exppdf(y,exp_ice);
p_exp_ice = p_exp_ice./sum(p_exp_ice);

hold on
plot(y,p_norm_ice,'LineWidth',1.5)
plot(y,p_rayl_ice,'LineWidth',1.5)
plot(y,p_exp_ice,'LineWidth',1.5)

legend('Histogram','Normal distribuition', 'Rayleigh distribuition',...
    'Exponencial distribuition')

%% ------------water-----------------
figure(4)
water=I3(:);
water = water - min(water(:));
water = water ./ max(water(:));
h=histogram(water, 'Normalization','probability')

norm_water = mle(water,'distribution', 'norm');
exp_water = mle(water,'distribution', 'exp');
rayl_water = mle(water,'distribution', 'rayl');

y = linspace(0, 1, h.NumBins);
p_norm_water = normpdf(y, norm_water(1), norm_water(2));
p_norm_water = p_norm_water./sum(p_norm_water);

p_rayl_water = raylpdf(y, rayl_water);
p_rayl_water = p_rayl_water./sum(p_rayl_water);
p_exp_water = exppdf(y,exp_water);
p_exp_water = p_exp_water./sum(p_exp_water);

hold on
plot(y,p_norm_water,'LineWidth',1.5)
plot(y,p_rayl_water,'LineWidth',1.5)
plot(y,p_exp_water,'LineWidth',1.5)

legend('Histogram','Normal distribuition', 'Rayleigh distribuition',...
    'Exponencial distribuition')


%% usinfg the reylight distribution 1x1


[lin, col]=size(I);
R_I = zeros(lin, col);
I = I - min(I(:));
I = I./ max(I(:));

for i=1:lin
   for j=1:col
       p_ice = (I(i,j)/rayl_ice^2)* exp(-((I(i,j)^2)/(2*rayl_ice^2)));
       p_water = (I(i,j)/rayl_water^2)* exp(-((I(i,j)^2)/(2*rayl_water^2)));
       
       if(p_water > p_ice)
           R_I(i,j) = 1; %water
       else
           R_I(i,j) = 0; %ice
       end
       
   end
end

figure(5)
imagesc(R_I)
colormap([0 0 204/255; 0 204/255 204/255])

%%  usinfg the reylight distribution 5x5

load('sar_image.mat');
[lin, col]=size(I);
k=9;
I_aux=I;

I_aux = I_aux - min(I_aux(:));
I_aux = I_aux./ max(I_aux(:));

I_aux=conv2(I_aux,(1/k^2)*ones(k),'same');

%f=fspecial('average',[k,k]);
%I_aux=imfilter(I,f);



R_I2 = zeros(lin, col);
for i=1:lin
   for j=1:col
       p_ice = (I_aux(i,j)/rayl_ice^2)* exp(-((I_aux(i,j)^2)/(2*rayl_ice^2)));
       p_water = (I_aux(i,j)/rayl_water^2)* exp(-((I_aux(i,j)^2)/(2*rayl_water^2)));
       
       if(p_water > p_ice)
           R_I2(i,j) = 1; %water
       else
           R_I2(i,j) = 0; %ice
       end
   end
end

figure(6)
imagesc(R_I2)
colormap([0 0 204/255; 0 204/255 204/255])



%% Calculate rate of detection

I2_aux=I3;
[lin, col]=size(I2_aux);
k=5;
%I2_aux=conv2(I3,(1/k^2)*ones(k));

I2_aux = I2_aux - min(I2_aux(:));
I2_aux = I2_aux./ max(I2_aux(:));
I2_aux=conv2(I2_aux,(1/k^2)*ones(k),'same');
R_I3 = zeros(lin, col);


for i=1:lin
   for j=1:col
       p_ice = (I2_aux(i,j)/rayl_ice^2)* exp(-((I2_aux(i,j)^2)/(2*rayl_ice^2)));
       p_water = (I2_aux(i,j)/rayl_water^2)* exp(-((I2_aux(i,j)^2)/(2*rayl_water^2)));
       
       if(p_water > p_ice)
           R_I3(i,j) = 1; %water
       else
           R_I3(i,j) = -1; %ice
       end
       
   end
end

figure(5)
imagesc(R_I3)
colormap([0 0 204/255; 0 204/255 204/255])
