

%For each octave we calculate the L images and subtract them
%Returning the 2 cell arrays as requested

function [spacescales , DoGs] = myDoGs (img,K,sigma,levels,octaves)
I = img;
spacescales ={};
DoGs ={};
kappa =sigma; % for easier and simple checks 
%kappa =1.1;

critical_j = ceil (levels/2);% The space scale that will be downsampled. We initialize it in
                            %case the algorithm does not find the double of
                            %sigma on its own

for i=1:octaves
     L = conv2(double(I),my2DGaussianFilter(K,sigma*(kappa^(0))),'same');%valid
     size = length(L);
     Ls = zeros(size,size,levels);
     dogs = zeros(size,size,levels-1);
     for j=1:levels
        Ls(:,:,j) = conv2(double(I),my2DGaussianFilter(K,sigma*(kappa^(j-1))),'same');%valid
        if (ceil(sigma*(kappa^(j-1)))==ceil(2*sigma))
            critical_j = j;
        end
     end
     for j=1:levels-1
       dogs(:,:,j)= (Ls(:,:,j)-Ls(:,:,j+1));
     end
     DoGs{end+1} = dogs;
     sigma=2*sigma;
     spacescales{end+1} = Ls;
     I = (imresize(Ls(:,:,critical_j),0.5));  %downsanpling
end






end

