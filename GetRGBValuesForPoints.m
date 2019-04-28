function colours = GetRGBValuesForPoints(img, points)
%This function returns the rgb values for specified point in the 3D image
%array. The specified points are held in the points array which contains
%rows with row and column data.
%Inputs:
%   img - 3D array with colour data for an image
%   points - 2D array with row and column data
%Output:
%   colours - a 1 column vector with 3 layers representing RGB
%Author: Nisal Jayaneththi

%Gets the number of points
[numOfPoints, ~] = size(points);

%Sets up the colours array
colours = zeros(numOfPoints, 1, 3);

%Loops through all the points 
for i = 1:numOfPoints
    %Get the colour data for each specified point and store it in colours
    colours(i,1,:) = img(points(i,1), points(i,2), :);
end

end