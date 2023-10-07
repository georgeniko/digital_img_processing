
%DIP Project 2
%Procedure of Ncut calculation according to the steps shown in class
function nCutValue = calculateNcut (anAffinityMat , clusterIdx)
assocAV=0;
assocBV=0;
assocAA=0;
assocBB=0;

for i=1:length(clusterIdx)
   if  clusterIdx(i)==1
       assocAV=assocAV+anAffinityMat(:,i);
   elseif clusterIdx(i)==2
       assocBV=assocBV+anAffinityMat(:,i);
   end
end

assocAV=sum(assocAV);
assocBV=sum(assocBV);

where_is_A=find(clusterIdx==1);
where_is_B=find(clusterIdx==2);

for i=1:length(where_is_A)
    for j=1:length(where_is_A)
        assocAA=assocAA+anAffinityMat(where_is_A(i),where_is_A(j));
    end
end
for i=1:length(where_is_B)
    for j=1:length(where_is_B)
        assocBB=assocBB+anAffinityMat(where_is_B(i),where_is_B(j));
    end
end

Nassoc = assocAA/assocAV + assocBB/assocBV;

nCutValue = 2-Nassoc %; missing in order to see the value

end

