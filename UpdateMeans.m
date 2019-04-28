function means = UpdateMeans(img, k, clusters)
%This function takes the preallocated clusters and the number of clusters
%and then calculates the new averages for the clusters using the colour
%data in the image
%Inputs:
%   img - a 3D array containing the colours for each pixel in the image
%   k - the number of clusters
%   clusters -  A 2D array which says which cluster each pixel belongs to
%Output:
%   means - an array with the new means for each cluster
%Author: Nisal Jayaneththi

%Get size of image
[rows, cols, ~] = size(img);

%Preallocate means array
means = zeros(k,1,3);

%Loop through each cluster
for c = 1:k
    
    %Find the positions in clusters where clusters == c
    %Algorithm Retrieved from: https://au.mathworks.com/help/matlab/ref/fin
    %d.html
    positions = find(clusters == c);
    
    %Calculate the red averages by taking the mean of the positions from
    %the image array (these positions correspond to the first layer)
    means(c,1,1) = mean(img(positions));
    
    %Calculate the blue averages by taking the mean of the positions from
    %the image array (these positions correspond to the second layer)
    means(c,1,2) = mean(img(rows*cols + positions));
    
    %Calculate the blue averages by taking the mean of the positions from
    %the image array (these positions correspond to the third layer)
    means(c,1,3) = mean(img(rows*cols*2 + positions));
end

end


