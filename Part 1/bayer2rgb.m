
function xrgb = bayer2rgb(xb)
M = size(xb, 1);
N = size(xb, 2);

%masks for 'gbrg' sensor alignment
red_mask = repmat([0 0; 1 0], M/2, N/2); 
green_mask = repmat([1 0; 0 1], M/2, N/2);
blue_mask = repmat([0 1; 0 0], M/2, N/2);
%extracting colour values from bayer filter
R=xb.*red_mask;
G=xb.*green_mask;
B=xb.*blue_mask;
 

%Convolvution of colour matrixes with a 3x3 local averaging mask
R=conv2(R, ones(3)./9,'valid');
G=conv2(G, ones(3)./9, 'valid');
B=conv2(B,ones(3)./9,'valid');
  
%In order to further improve the image
R = conv2(R,[1 2 1; 2 4 2; 1 2 1]/4, 'same'); 
G = conv2(G, [0 1 0; 1 4 1; 0 1 0]/4, 'same');
B = conv2(B,[1 2 1; 2 4 2; 1 2 1]/4, 'same');

xrgb(:,:,1)=R; 
xrgb(:,:,2)=G; 
xrgb(:,:,3)=B;
 
end
