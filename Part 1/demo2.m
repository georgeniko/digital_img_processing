
%Demo 2, Image resize
clear all;

%WARNING : 'march.mat' file is not included in the .zip according to
%sumbission guidelines. Make sure it is in your directory defore running
%the demos, or change the filename to one of your choice. 

filename = 'march.mat';
input_data = load(filename);
image=input_data.x;

rgb_image=bayer2rgb(image);
image_size=size(rgb_image);

N=240;
M=320;

method='nearest';
result1= myresize(rgb_image,N,M,method);
figure(1)
imshow(result1)
title(sprintf('%dx%d Image with %s method',N,M,method));

N=200;
M=300;
method='linear';
result2= myresize(rgb_image,N,M,method);
figure(2)
imshow(result2)
title(sprintf('%dx%d Image with %s method',N,M,method));
