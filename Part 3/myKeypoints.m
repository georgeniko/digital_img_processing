

%We find the 26 neighbours and put them in a list.
%If the current pixel is man/min of that list we add it the returning
%cell array

function keypoints = myKeypoints(DoGs)

aaa = DoGs{1}; % in order to extract the number of levels
levels = length(aaa(1,1,1:end))+1;
keypoints ={};

for k=1:length(DoGs) % k = octave
    data = DoGs{k};
    for m=2:levels-2 % m = space scale
        current_space_scale=m;
        down=current_space_scale-1;
        up=current_space_scale+1;
        for i=2:length(data)-1 %not the edges of the photo
        
            for j=2:length(data)-1

                list = zeros(26,1);        
                %Below DoG
                list(1) = data(i-1,j-1,down);
                list(2) = data(i-1,j,down);
                list(3) = data(i-1,j+1,down);
                list(4) = data(i,j-1,down);
                list(5) = data(i,j,down);
                list(6) = data(i,j+1,down);
                list(7) = data(i+1,j-1,down);
                list(8) = data(i+1,j,down);
                list(9) = data(i+1,j+1,down);

                %Above DoG
                list(10) = data(i-1,j-1,up);
                list(11) = data(i-1,j,up);
                list(12) = data(i-1,j+1,up);
                list(13) = data(i,j-1,up);
                list(14) = data(i,j,up);
                list(15) = data(i,j+1,up);
                list(16) = data(i+1,j-1,up);
                list(17) = data(i+1,j,up);
                list(18) = data(i+1,j+1,up);

                %Current DoG
                list(19) = data(i-1,j-1,current_space_scale);
                list(20) = data(i-1,j+1,current_space_scale);
                list(21) = data(i-1,j,current_space_scale);
                list(22) = data(i,j+1,current_space_scale);
                list(23) = data(i,j-1,current_space_scale);
                list(24) = data(i+1,j+1,current_space_scale);
                list(25) = data(i+1,j-1,current_space_scale);
                list(26) = data(i+1,j,current_space_scale);
                list =imcomplement(list);
                max_value = max (list(:));
                min_value = min (list(:));

                %Complement of the regular expression in order to perform
                %only one check
                if (ceil(data(i,j,current_space_scale))<max_value) && (floor(data(i,j,current_space_scale))>min_value)
                    keypoints{end+1} = [k,m,i,j]; 
                end
          
             
            end
        end
    end
end


end
