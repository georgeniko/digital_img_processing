
%Demo1 , Converting to RGB
clear all;
%WARNING : 'march.mat' file is not included in the .zip according to
%sumbission guidelines. Make sure it is in your directory defore running
%the demos, or change the filename to one of your choice. 

filename = 'march.mat';
input_data = load(filename);
image=input_data.x;

rgb_image=bayer2rgb(image);
imshow(rgb_image);
title('RGB Image');
