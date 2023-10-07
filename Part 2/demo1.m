
%DIP Project 2
%Demo 1

clear all;
rng(1);
filename = 'dip_hw_2.mat';
load(filename);


s = size(d1a);
clusterIdx2 = mySpectralClustering(d1a,2);
clusterIdx3 = mySpectralClustering(d1a,3);
clusterIdx4 = mySpectralClustering(d1a,4);
%imshow(d1a);




%Visualization not working properly for this demo
% newcolors = [0 0 1;%b
%              1 0 0; %r
%               0 1 0;%g
%               1 1 1];%w
%k=2;
% [y,x] = find(d1a) ;
% idx = d1a>0 ; 
% z = d1a(idx) ;
% figure(k)
% imshow(d1a);
% hold on 
% title(sprintf('d1a image with k=%d',k));
% for j =1:12
% for i=1:k
%     p=plot(x(clusterIdx2==i),y(clusterIdx2==i),'.') ;
%     q=plot(y(clusterIdx2==i),x(clusterIdx2==i),'.') ;
%     p.Color =  newcolors(i,:);
%     q.Color = newcolors(i,:);
% end
% end

% k=3;
% [y,x] = find(d1a) ;
% idx = d1a>0 ; 
% z = d1a(idx) ;
% figure(k)
% imshow(d1a);
% hold on 
% title(sprintf('d1a image with k=%d',k));
% for i=1:k
%     p=plot(x(clusterIdx3==i),y(clusterIdx3==i),'.') ;
%     p.Color =  newcolors(i,:);
% end
% 
% k=4;
% [y,x] = find(d1a) ;
% idx = d1a>0 ; 
% z = d1a(idx) ;
% figure(k)
% imshow(d1a);
% hold on 
% title(sprintf('d1a image with k=%d',k));
% for i=1:k
%     p=plot(x(clusterIdx4==i),y(clusterIdx4==i),'.') ;
%     p.Color =  newcolors(i,:);
% end
