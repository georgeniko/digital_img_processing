
%DIP Project 2
function myAffinityMat = Image2Graph(imIn)
size_of_img=size(imIn);
M=size_of_img(1);
N=size_of_img(2);
first=imIn(:,:,1)'; % Split each colour in order to calculate brightness distance
second=imIn(:,:,2)';
third=imIn(:,:,3)';
converted1 = first(:);
converted2 = second(:);
converted3 = third(:);

myAffinityMat = zeros(M*N,M*N);

for i=1: M*N %Conversion according to the given formula
    a= converted1(i);
    b = converted2(i); 
    c= converted3(i);
    for j=1:M*N
       
         d= converted1(j);
         e = converted2(j); 
         f= converted3(j);
         dist= sqrt((a-d)^2 + (b-e)^2 + (c-f)^2); %distance
         myAffinityMat(i,j)=1/(exp(dist)); 
    end
end
end
