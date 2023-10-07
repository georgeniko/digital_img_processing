
%DIP Project 2
%Demo 3a

clear all;
rng(1);
filename = 'dip_hw_2.mat';
load(filename);

newcolors = [0 0 1;%b
             1 0 0; %r
              0 1 0;%g
              1 1 1];%y
newcolors1 = [0 0 0;%bl 1
             1 1 1; %w 2 
              1 0 0;%r 
              0 1 0];%g];
          
% Image d2a
%%Visualization not working properly, but allows us to make a few
%assumptions
k=2;
w1 = Image2Graph(d2a);
w1_spectral_idx2 = mySpectralClustering(w1,k);
w1__ncuts_idx2 = myNCuts(w1,k);
plot_spectral_vs_ncuts (d2a ,w1__ncuts_idx2,w1_spectral_idx2, k,newcolors1,"d2a");

k=3;
w1_spectral_idx3 = mySpectralClustering(w1,k);
w1__ncuts_idx3 = myNCuts(w1,k);
plot_spectral_vs_ncuts (d2a ,w1__ncuts_idx3,w1_spectral_idx3, k,newcolors1,"d2a");

k=4;
w1_spectral_idx4 = mySpectralClustering(w1,k);
w1_ncuts_idx4 = myNCuts(w1,k);
plot_spectral_vs_ncuts (d2a ,w1_ncuts_idx4,w1_spectral_idx2, k,newcolors1,"d2a");

          
% %Image d2b          
w2 = Image2Graph(d2b); 
k=2;
w2_spectral_idx2 = mySpectralClustering(w2,k);
w2_ncuts_idx2 = myNCuts(w2,k);
plot_spectral_vs_ncuts (d2b ,w2_ncuts_idx2,w2_spectral_idx2, k,newcolors,"d2b");

k=3;
w2_spectral_idx3 = mySpectralClustering(w2,k);
w2_ncuts_idx3 = myNCuts(w2,k);
plot_spectral_vs_ncuts (d2b ,w2_ncuts_idx3,w2_spectral_idx3, k,newcolors,"d2b");

k=4;
w2_spectral_idx4 = mySpectralClustering(w2,k);
w2_ncuts_idx4 = myNCuts(w2,k);
plot_spectral_vs_ncuts (d2b ,w2_ncuts_idx4,w2_spectral_idx4, k,newcolors,"d2b");



function plot_spectral_vs_ncuts (img ,ncutIdx,spectralIdx, k,colors,name)
if name=="d2b"
    [y,x] = find(img) ;
    figure(k)
    imshow(img);
    hold on 
    for i=1:k
        p=plot(x(ncutIdx==i),y(ncutIdx==i),'.') ;
        p.Color =  colors(i,:);
    end
    title(sprintf('%s-ncuts with k=%d',name,k));
    xlabel('myNcuts & CalculateNcut for Demo 3a')
%     figure(k+5)   % if we want to print spectral as well for comparison
%     imshow(img);
%     hold on 
%     for i=1:k
%         p=plot(x(spectralIdx==i),y(spectralIdx==i),'.') ;
%         p.Color =  colors(i,:);
%     end
%     title(sprintf('%s-spectral with k=%d',name,k));
%     xlabel('Spectral for Demo 3a')
else
   [y,x] = find(img);
   temp1 = [y]';
   temp2 = [x]';
   figure(k+4)
   imshow(img);
   hold on
   for i=1:k
        plot(temp1(ncutIdx==i),temp2(ncutIdx==i),'*') ;
        Color =  colors(i,:);
   end
   title(sprintf('%s-ncuts with k=%d',name,k));
   xlabel('myNcuts & CalculateNcut for Demo 3a')
end
end
