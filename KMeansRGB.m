function [finalClusters, meanColours] = KMeansRGB(img, meanColours, maxI)
%This function assigns the pixels in an image into k number of groups using
%the k-means algorithm which has an assignment step which splits the pixels
%into groups using the colours of seed points, then updating the means and
%then reassigning pixels to groups based on new means, this continues until
%there is no more change to the means or the max number of iterations have
%been reached
%Inputs:
%   img - a 3D array containing the colours for each pixel in the image
%   meanColours - the colours for the means
%   maxI - the max number of iterations to run
%Outputs:
%   finalClusters - the final pixel assignments
%   meanColours - the average colours for each group of pixels
%Author: Nisal Jayaneththi

%Gets the number of means
[numberOfClusters, ~, ~] = size(meanColours);

%Run a for loop maxI times
for i = 1:maxI
    %Set the previousMeans
    previousMeans = meanColours;
    
    %Assign each pixel in the image to a cluster
    finalClusters = AssignToClusters(img, meanColours);
    
    %Calculate the mean colours from the cluster assignments
    meanColours = UpdateMeans(img, numberOfClusters, finalClusters);
    
    %Display current iteration
    %disp(['Iteration ' num2str(i)]);
    
    %Check if the new means are equal to the old means
    %Retrieved from: https://au.mathworks.com/help/matlab/ref/isequal.html
    if isequal(meanColours, previousMeans)
        
        %If they are, then display when convergence occured
        disp(['convergence reached at iteration ' num2str(i)]);
        %Then quit for loop
        %Break statement found:https://au.mathworks.com/help/matlab/ref/bre
        %ak.html
        break;
        
    elseif i == maxI %Check if the max iterations have been reached
        disp('Max Iterations Reached');
    end
end

end

