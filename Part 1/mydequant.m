

function x = mydequant(q, w)
%Dequantization
%We will transform the values of the q array  to  x values of [0,1]
ximg=double(mod(q,2^w));
x_to_or=ximg.*w;

%Normalization of values for a more natural appearance
x = (x_to_or-min(x_to_or(:))) / (max(x_to_or(:))-min(x_to_or(:)));

end
