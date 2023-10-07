

function x = imagedequant(q,w1,w2,w3)
%Image Dequantization
%We will transform the values of the pixels to brightness values of [0,1]
rq=mydequant(q(:,:,1), w1^3);
gq=mydequant(q(:,:,2), w2^3);
bq=mydequant(q(:,:,3), w3^3);

x=cat(3,rq,gq,bq);

end
