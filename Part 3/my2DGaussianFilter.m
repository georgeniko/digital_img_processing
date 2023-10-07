
%Gaussian Filter
function myGFilter = my2DGaussianFilter( K , sigma)
myGFilter=zeros(K,K); 
for i=-(K-1)/2:(K-1)/2
    for j=-(K-1)/2:(K-1)/2
        x_center=(K+1)/2; 
        y_center=(K+1)/2; 
        x=i+x_center; 
        y=j+y_center; 
        myGFilter(x,y)=exp(-((x-x_center)^2+(y-y_center)^2)/2/sigma/sigma)/2/pi/sigma/sigma;
    end
end
myGFilter=myGFilter/sum(myGFilter(:));
end
