function finalImage = CreateKColourImage(clusters, meanColours)
%This function outputs a 8 bit image based on pixel clusters and the
%colour values for each cluster (held in meanColours)
%Input:
%   clusters - A 2D array which contains the cluster than each pixel is in
%   meanColours - the RGB values for each cluster
%Output:
%   finalImage - an unsigned 8 bit image
%Author: Nisal Jayaneththi

%Get the size of the image
[rows, cols, ~] = size(clusters);

%Preallocate the final image array
finalImage = zeros(rows, cols, 3);

%Loop through rows of the image
for i=1:rows
    %Loop through columns of the image
    for j = 1:cols
        %Set the RGB for the final image based on which cluster the pixel
        %is in
        finalImage(i,j,:) = meanColours(clusters(i,j), 1, :);
    end
end

%Convert the array to an unsigned 8 bit image
finalImage = uint8(finalImage);
end