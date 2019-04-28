function clusters = AssignToClusters(img, kMeans)
%This function takes the colour values for the means for each cluster and
%then assigns every pixel in the image to a cluster by finding which mean
%each cluster is closest to.
%Inputs:
%   img - a 3D array containing the colours for each pixel in the image
%   kMeans - contains the colour data for each mean
%Output:
%   clusters -  A 2D array which says which cluster each pixel belongs to
%Author: Nisal Jayaneththi

%Gets the size of the image
[rows, cols, ~] = size(img);

%Gets the number of means
[k,~,~] = size(kMeans);

%Preallocates the distances array which is a rows x cols x k array
distances = zeros(rows, cols, k);

%Convert kMeans to a 1x3xk array from a kx1x3 (from rows by columns by
%colours to columns by colours by rows)
%Algorithm retrieved from: https://au.mathworks.com/help/matlab/ref/permute
%.html
kMeans = permute(kMeans, [2 3 1]);
 
%Loops through all of the colours
for i = 1:3    
    %Calculates the squared distance for each colour and then adds it to
    %the distances array
    distances = distances + minus(img(:,:,i), kMeans(1, i, :)).^2;
end

%Get the position of the minimum distance for each pixel and assign to
%clusters array
[~, clusters] = min(distances, [], 3);
end



