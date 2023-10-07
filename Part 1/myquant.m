

function q = myquant(x, w)

%Quantization
%We will transform the float values of x array [0,1] to integers according to the total of diffenert colours 
array_info=size(x);
platos=array_info(2);
ipsos=array_info(1);
q=zeros(100);
for i=1:ipsos
     for j=1:platos
      threshold=1/w;
         for k=1:w
            if(x(i,j)>threshold)
                q(i,j)=threshold+1/w;
                threshold=threshold+1/w;
            end
         end
     end
end
different_colours = 2^w;
q=uint8(different_colours*q);
end
