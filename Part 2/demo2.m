
%DIP Project 2
%Demo 2

clear all;
rng(1);
filename = 'dip_hw_2.mat';
load(filename);

newcolors2 = [0 0 1;
             1 0 0; 
              0 1 0;
              1 1 1];
newcolors1 = [0 0 0;
             1 1 1; 
              1 0 0;
              0 1 0];
          
%By running the script we will get 3 plots for d2a and 3 for d2b

% Image d2a
%%Visualization not working properly, but allows us to make a few
%assumptions
k=2;
w1 = Image2Graph(d2a);  
w1_idx2 = mySpectralClustering(w1,k);
plot_image (d2a ,w1_idx2, k,newcolors1,"d2a");

k=3;
w1_idx3 = mySpectralClustering(w1,k);
plot_image (d2a ,w1_idx3, k,newcolors1,"d2a");

k=4;
w1_idx4 = mySpectralClustering(w1,k);
plot_image (d2a ,w1_idx4, k,newcolors1,"d2a");



% %Image d2b
% %Visualization working fine
w2 = Image2Graph(d2b); 
k=2;
w2_idx2 = mySpectralClustering(w2,k);
plot_image (d2b ,w2_idx2, k,newcolors2,"d2b");

k=3;
w2_idx3 = mySpectralClustering(w2,k);
plot_image (d2b ,w2_idx3, k,newcolors2,"d2b");

k=4;
w2_idx4 = mySpectralClustering(w2,k);
plot_image (d2b ,w2_idx4, k,newcolors2,"d2b");



function plot_image (img ,clusterIdx, k,colors,name)

if name == "d2b"
    [y,x] = find(img) ;
    figure(k+3)
    imshow(img);
    hold on 
    for i=1:k
        p=plot(x(clusterIdx==i),y(clusterIdx==i),'.') ;
        p.Color =  colors(i,:);
    end
    xlabel('Image2Graph & mySpectralClustering for Demo 2')
else
   [y,x] = find(img);
   temp1 = [y]';
   temp2 = [x]';
   figure(k)
   imshow(img);
   hold on
   for i=1:k
        plot(temp1(clusterIdx==i),temp2(clusterIdx==i),'.') ;
        Color =  colors(i,:);
   end
   xlabel('Image2Graph & mySpectralClustering for Demo 2')
end

title(sprintf('%s with k=%d',name,k));
end
