

function q = imagequant(x,w1,w2,w3)

%Image Quantization
%We will transform the float brightness values [0,1] to colour values [0,255]

rq=myquant(x(:,:,1),w1);
gq=myquant(x(:,:,2),w2);
bq=myquant(x(:,:,3),w3);



%Procedure in order to make sure it can handle special situations, such as
%arrays of different size
blue_size = size(bq);
red_size = size(rq);
green_size = size(gq);
sizes = [blue_size; red_size ;green_size]';
minx=min(sizes(1,:));
miny=min(sizes(2,:));
rq=rq(1:minx,1:miny);
bq=bq(1:minx,1:miny);
gq=gq(1:minx,1:miny);
q=cat(3,rq,gq,bq);

end
