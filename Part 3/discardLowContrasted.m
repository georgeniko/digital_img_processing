

%Rejection of low contrasted keypoints, as requested.

function keypointsHighC = discardLowContrasted (DoGs , keypoints, t, p)

test_value = p*t;

keypointsHighC = {};
for j=1:length(keypoints)
    M = keypoints{1,j};
    data = DoGs{M(1)};
    brightness_array = data(:,:,M(2));
    if ((abs(brightness_array(M(3),M(4))))>(test_value))
        keypointsHighC{end +1} = keypoints{1,j};
    end    
   
end


end
