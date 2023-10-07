

%Demo 2 for 2 images
%WARNING: Execution of the script may take roughly a minute, in order to
%plot the keypoints on the images. 
%For each image we get one diagramm with unfiltered (GREEN) keypoints on the Dogs
%and another one with the filtered (RED) keypoints.

clc;   
clear all; 


input_data = load('dip_hw_3.mat');

octaves = 3;
levels = 5;
K = 7;
sigma=sqrt(2);

%Procedure For Roofs
I = input_data.roofs;
I = uint8(255*mat2gray(I));
original_image = I;
[spacescales , DoGs] = myDoGs(original_image,K,sigma,levels,octaves);
keypoints = myKeypoints(DoGs);



num_of_plots =octaves*(levels-1);
figure(1);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        hold on;
        for m=1:length(keypoints)
            M = keypoints{1,m};
           if( M(1)==j ) && (M(2)==d )
             p=plot(M(4),M(3),'.') ;
             p.Color = [0 1 0];%g
           end
        end
        num_of_plots=num_of_plots-1;
        xlabel("Salient keypoints on  DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle("Unfiltered Salient keypoints on DoG");


%Filtering Procedure
nspo =levels-2;
t = ((2^(1/nspo)-1) / (2^(1/3)-1));
p=0.35;
test_value = p*t;


keypointsHighC = discardLowContrasted (DoGs , keypoints, t, p);
num_of_plots =octaves*(levels-1);
figure(2);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        hold on;
        for m=1:length(keypointsHighC)
            M = keypointsHighC{1,m};
           if( M(1)==j ) && (M(2)==d )
             p2=plot(M(4),M(3),'.') ;
             p2.Color = [1 0 0];%g
           end
        end
        num_of_plots=num_of_plots-1;
        xlabel("Filtered keypoints on  DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle(sprintf('Filtered Salient keypoints on DoG, p=%.2f',(p)));



%Procedure For Mountains
I = input_data.mountains;
I = uint8(255*mat2gray(I));
original_image = I;
[spacescales , DoGs] = myDoGs(original_image,K,sigma,levels,octaves);
keypoints = myKeypoints(DoGs);



num_of_plots =octaves*(levels-1);
figure(3);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        hold on;
        for m=1:length(keypoints)
            M = keypoints{1,m};
           if( M(1)==j ) && (M(2)==d )
             p3=plot(M(4),M(3),'.') ;
             p3.Color = [0 1 0];%g
           end
        end
        num_of_plots=num_of_plots-1;
        xlabel("Salient keypoints on  DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle("Unfiltered Salient keypoints on DoG");




keypointsHighC = discardLowContrasted (DoGs , keypoints, t, p);
num_of_plots =octaves*(levels-1);
figure(4);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        hold on;
        for m=1:length(keypointsHighC)
            M = keypointsHighC{1,m};
           if( M(1)==j ) && (M(2)==d )
             p2=plot(M(4),M(3),'.') ;
             p2.Color = [1 0 0];%r
           end
        end
        num_of_plots=num_of_plots-1;
        xlabel("Filtered keypoints on  DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle(sprintf('Filtered Salient keypoints on DoG, p=%.2f',(p)));



