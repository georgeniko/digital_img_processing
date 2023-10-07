
%Demo 3, quantization and dequantization
clear all;

%WARNING : 'march.mat' file is not included in the .zip according to
%sumbission guidelines. Make sure it is in your directory defore running
%the demos, or change the filename to one of your choice. 

filename = 'march.mat';
input_data = load(filename);
image=input_data.x;

rgb_image=bayer2rgb(image);

% 3 bits for each colour so we have (2^3)^3 different  colours
w=8; % 1/w is used inside the myquant function for calculations
quantized=imagequant(rgb_image,w,w,w);
figure(2)
imshow(quantized);
title(sprintf('Quantized Image'));


dequantized=imagedequant(quantized,w,w,w);
figure(3)
imshow(dequantized);
title(sprintf('Dequantized Image'));
