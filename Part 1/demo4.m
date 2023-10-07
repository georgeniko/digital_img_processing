
%Demo 4, full project pipeline
clear all;

%WARNING : 'march.mat' file is not included in the .zip according to
%sumbission guidelines. Make sure it is in your directory defore running
%the demos, or change the filename to one of your choice. 

filename = 'march.mat';
input_data = load(filename);
image=input_data.x;


rgb_image=bayer2rgb(image);
figure(1)
imshow(rgb_image);
title('RGB Image');

N=150; 
M=200;
method='linear';
resized = myresize(rgb_image,N,M,method);
figure(2)
imshow(resized);
title(sprintf('%dx%d Resized Image with %s method',N,M,method));

w=8;% 3 bits for each colour 
quantized=imagequant(resized,w,w,w);
figure(3)
imshow(quantized);
title(sprintf('Quantized Image'));


filename_for_saving = 'dip_is_fun.ppm';
saveasppm(quantized,filename_for_saving,2^w-1);
saved=imread(filename_for_saving);
figure(4)
imshow(saved)
title(sprintf("Saved image"));
