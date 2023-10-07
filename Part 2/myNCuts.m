
%DIP Project 2, m-cuts mehod. Check the report on detailed instructions on
%how to run the recursive or the non-recursive version
function final_clusters = myNCuts(anAffinityMat , k)
rng(1);
s = size(anAffinityMat);
D =zeros (s(1),s(2));
for i =1:s(1)
    D(i,i)= sum(anAffinityMat(i,:));
end
L = D-anAffinityMat;
[U,~] =  eigs(L,D,k,'smallestabs'); 
[clusterIdx , ~] = kmeans(U,k);
final_clusters = clusterIdx; %initialize the returning array

%Recursive Version. For 3b uncomment the && k+2<=2 at line 24
% ncut1 = calculateNcut(anAffinityMat,clusterIdx);
% j=1;
% while (j<=k)% for each cluster
%     number_of_A = length(find(final_clusters==j)); 
%     clusterIdx1 = find(final_clusters==j);%take only the selected cluster values
%     T1 = 5;  
%     T2 = 0.2; %if number_of_A<T1 or  ncut > T2=0.2 then we stop
%     if ((number_of_A>=T1  ) || ncut1<=T2 ) && k+1<=5 %&& k+2<=2 %!!! WARNING for demo 3b uncomment the last check
%         w1 = anAffinityMat((clusterIdx==j),(clusterIdx==j)); %further split 
%         clusterIdx1=myNCuts(w1 , k+2); %recursive call of the function 
%         ncut1 = calculateNcut(w1,clusterIdx1); %new ncut value
%         final_clusters((clusterIdx1==k+1))=k+1 ; %save the new clusters
%         final_clusters((clusterIdx1==k+2))=k+2 ;
%     end
% j=j+1; 
% end


end
