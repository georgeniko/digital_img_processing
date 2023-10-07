
%Demo 1 for 2 images
%For each image we get 1 diagramm with octaves & scale spaces
% and onther one with the DOGS.

clc;   
clear all; 

input_data = load('dip_hw_3.mat');

octaves = 3;
levels = 5;
K = 7;
sigma=sqrt(2);

%Procedure For Roofs
I = input_data.roofs;
img = I;


[spacescales , DoGs] = myDoGs(img,K,sigma,levels,octaves);

num_of_plots =octaves*levels;
figure(1);
for j=1:octaves
    s1 = spacescales{j};
    for i=1:levels
        subplot(octaves,levels,num_of_plots);
        imshow(s1(:,:,i));
        num_of_plots=num_of_plots-1;
        xlabel("level "+(i));
    end
    ylabel("Octave "+j);
end
suptitle("Scale Spaces");

num_of_plots =octaves*(levels-1);
figure(2);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        num_of_plots=num_of_plots-1;
        xlabel("DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle("Difference of Gaussians");


%Procedure For Mountains
I = input_data.mountains;
img = I;

[spacescales , DoGs] = myDoGs(img,K,sigma,levels,octaves);

num_of_plots =octaves*levels;
figure(3);
for j=1:octaves
    s1 = spacescales{j};
    for i=1:levels
        subplot(octaves,levels,num_of_plots);
        imshow(s1(:,:,i));
        num_of_plots=num_of_plots-1;
        xlabel("level "+(i));
    end
    ylabel("Octave "+j);
end
suptitle("Scale Spaces");

figure(4);
num_of_plots =octaves*(levels-1);
for j=1:octaves
    dog_to_print = DoGs{j};
    for d=1:levels-1
        dog_to_print = (double(dog_to_print) -double(min(dog_to_print(:))) )/ (double(-min(dog_to_print(:))+max(dog_to_print(:)))) ;
        subplot(octaves,levels-1,num_of_plots);
        imshow((dog_to_print(:,:,d)));
        num_of_plots=num_of_plots-1;
        xlabel("DoG "+(d));
    end
    ylabel("Octave "+j);
end
suptitle("Difference of Gaussians");
