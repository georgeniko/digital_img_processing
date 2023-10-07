
%DIP Project 2
%Procedure of Spectral Clustering according to the steps shown in class
function clusterIdx = mySpectralClustering (anAffinityMat , k)
rng(1);
s = size(anAffinityMat); 
D =zeros (s(1),s(2));
for i =1:s(1)
    D(i,i)= sum(anAffinityMat(i,:));
end
L = D-anAffinityMat;
[U,~] =  eigs(L,k,'smallestabs'); 
clusterIdx = kmeans(U,k);
end
