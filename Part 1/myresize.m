

function resized = myresize(rgb_image,N,M,method)
image_size=size(rgb_image);

if method == "nearest"
    resized=zeros([N,M,3]);
    %Nearest Neighbor Interpolation
    %We will calculate which indices of the image array we will keep and select only those for
    %the resized image
    
    %First we calculate resizing rations
    row_ratio = N/image_size(1);
    column_ratio = M/image_size(2);
    
    %Then we find the row and column indices for the interpolation
    row_indices = ceil((1:(image_size(1)*row_ratio))./(row_ratio));
    column_indices = ceil((1:(image_size(2)*column_ratio))./(column_ratio));
    
    %Interpolation for each colour seperately
    
    %Red colours
    colour_instance= rgb_image(:,:,1);     
    R = colour_instance(row_indices,:);	% New Row Values
    R = R(:,column_indices);%New Column Values
    %Green colours
    colour_instance= rgb_image(:,:,2);     
    G = colour_instance(row_indices,:);% New Row Values
    G = G(:,column_indices);%New Column Values
    %Blue colours
    colour_instance= rgb_image(:,:,3);     
    B = colour_instance(row_indices,:); % New Row Values
    B = B(:,column_indices);%New Column Values
    
    resized(:,:,1)=R;
    resized(:,:,2)=G;
    resized(:,:,3)=B;
elseif method == "linear"
    %First we will calculate row and column ratio in order to keep only some of
    %the pixels without damaging the actual file.
    %Afterwards, we will brake the image into little squares and keep only
    %one pixel from these squares
    %We will tie these pixels together and we are done!
    
    input_height = image_size(1);
    input_width = image_size(2);
    output_height=N;
    output_width=M;
    red_resized = zeros(output_height, output_width);
    green_resized = zeros(output_height, output_width);
    blue_resized = zeros(output_height, output_width);
    row_ratio=0;
    column_ratio=0;
    if output_width>1
        row_ratio =double(input_width - 1) /(output_width - 1);   
    end   
    if output_height>1
        column_ratio =double(input_height - 1) /(output_height - 1);  
    end
    for i=1:output_height
        for j=1:output_width
              if j==output_width  %Special adjastments for edges only
                    red_resized(i,output_width) = red_resized(i,output_width-1);
                    green_resized(i,output_width) =green_resized(i,output_width-1);
                    blue_resized(i,output_width) =blue_resized(i,output_width-1);

              elseif i==output_height %Special adjastments for edges only
                    red_resized(output_height,j) = red_resized(output_height-1,j);
                    green_resized(output_height,j) =green_resized(output_height-1,j);
                    blue_resized(output_height,j) =blue_resized(output_height-1,j);

              else   %Regular Procedure
                  
                    %Find the square that represents the space in the image
                    %we are in. We "skip" some pixels with the row and column ratios 
                    x_l=floor(row_ratio * j);
                    y_l =floor(column_ratio * i);
                    x_h=ceil(row_ratio * j);
                    y_h =ceil(column_ratio * i);

                    row_weight =(row_ratio * j) - x_l;
                    column_weight =(column_ratio * i) - y_l;

                    %Four points for each square (and 3 sqares for all colours)
                    
                    a_red = rgb_image(y_l, x_l,1);
                    b_red = rgb_image(y_l, x_h,1);
                    c_red = rgb_image(y_h, x_l,1);
                    d_red = rgb_image(y_h, x_h,1);
                    a_green = rgb_image(y_l, x_l,2);
                    b_green = rgb_image(y_l, x_h,2);
                    c_green = rgb_image(y_h, x_l,2);
                    d_green = rgb_image(y_h, x_h,2);
                    a_blue = rgb_image(y_l, x_l,3);
                    b_blue = rgb_image(y_l, x_h,3);
                    c_blue = rgb_image(y_h, x_l,3);
                    d_blue = rgb_image(y_h, x_h,3);

                    
                    %If we consider a,b,c,d the above square then we
                    %calculate the interpolated pixel that we will keep 
                    
                    red = a_red*(1 - row_weight)*(1 - column_weight)...
                          + b_red*row_weight*(1 - column_weight)+ ...
                          c_red*column_weight*(1 - row_weight) + ...
                          d_red*row_weight*column_weight;
                    green =a_green*(1 - row_weight)*(1 - column_weight)...
                          +b_green*row_weight*(1 - column_weight)+ ...
                          c_green*column_weight*(1 - row_weight)+ ...
                          d_green*row_weight*column_weight;
                    blue =a_blue*(1 - row_weight)*(1 - column_weight)...
                          + b_blue*row_weight*(1 - column_weight)+ ...
                          c_blue*column_weight*(1 - row_weight)+ ...
                          d_blue*row_weight*column_weight;

                    red_resized(i,j) = red;
                    green_resized(i,j) =green;
                    blue_resized(i,j) =blue;
              end
        end
    end
    resized = cat(3,red_resized,green_resized,blue_resized);
else
    fprintf('Error! Invalid downsampling method!\n');
    resized=0;
end

end
