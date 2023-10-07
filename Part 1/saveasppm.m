

function saveasppm(x, filename , K)
%Function that saves the image as a ppm file

tosave =uint8(x);
image_size=size(tosave);
height=image_size(1);
width=image_size(2);
fid=fopen(filename,'w');
fprintf(fid,'P6\n%d %d %d\n',width,height,K);

for i=1:height
    for j=1:width
        fwrite(fid,tosave(i,j,1));
        fwrite(fid,tosave(i,j,2));
        fwrite(fid,tosave(i,j,3));
    end
end
fclose(fid);
end
