% This script runs the KMeans Algorithm, to use it, insert the desired
% image into the folder, then enter the file name when prompted eg
% 'tree.jpg', the number of colours wanted, and the number of max
% iterations.

% Ask for image name
imageName = input('Enter image name: ', 's');

% Load image
image = imread(imageName);

% Ask for number of colours - k
k = input('Enter the number of colours you want to use: ');

% Ask for max iterations
maxIterations = input('Enter max iterations: ');

% Convert image values to double to enable calculations
image = double(image);

% Select random points to be our seed means
[kRandomPoints] = SelectKRandomPoints(image, k);

% Get the colours of the random means
randomMeans = GetRGBValuesForPoints(image, kRandomPoints);


%Run the KMeans Algorithm
[clusters, means] = KMeansRGB(image, randomMeans, maxIterations);

%Create the new image
newImage = CreateKColourImage(clusters, means);

%Display the new image
imshow(newImage);

title([num2str(k) ' colour version of ' imageName]);

    
    