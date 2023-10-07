
%DIP Project 2
%Demo 3c


clear all;
rng(1);
filename = 'dip_hw_2.mat';
load(filename);

newcolors = [0 0 1;
             1 0 0; 
              0 1 0;
              1 1 1];
newcolors1 = [0 0 0;
             1 1 1; 
              1 0 0; 
              0 1 0];  
%Image d2a          
w1 = Image2Graph(d2a); 
k=2;
w1_spectral_idx2 = mySpectralClustering(w1,k);
w1_ncuts_idx2 = myNCuts(w1,k);
plot_ncutsre (d2a ,w1_ncuts_idx2, k,newcolors,"d2a",max(w1_ncuts_idx2));
          
% %Image d2b          
w2 = Image2Graph(d2b); 
k=2;
w2_spectral_idx2 = mySpectralClustering(w2,k);
w2_ncuts_idx2 = myNCuts(w2,k);
plot_ncutsre (d2b ,w2_ncuts_idx2, k,newcolors,"d2b",max(w2_ncuts_idx2));

          
          
function plot_ncutsre (img ,ncutIdx, k,colors,name,num_clusters)
if name =="d2b"
    [y,x] = find(img) ;
    figure(k)
    imshow(img);
    hold on 
    for i=1:num_clusters
        p=plot(x(ncutIdx==i),y(ncutIdx==i),'.') ;
        p.Color =  colors(i,:);
    end
    title(sprintf('%s-ncuts-re with %d clusters',name,num_clusters));
    xlabel('Recursive n-cuts Demo 3c');
else
   [y,x] = find(img);
   temp1 = [y]';
   temp2 = [x]';
   figure(k+4)
   imshow(img);
   hold on
   for i=1:num_clusters
        plot(temp1(ncutIdx==i),temp2(ncutIdx==i),'*') ;
        Color =  colors(i,:);
   end
    title(sprintf('%s-ncuts-re with %d clusters',name,num_clusters));
    xlabel('Recursive n-cuts Demo 3c');
end
end
