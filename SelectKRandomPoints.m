function points = SelectKRandomPoints(img, k)
%This function selects k number of random points from an image and then
%returns an array which stores the row and column of each point
%Inputs:
%   img - A 3D array which contains the pixel data for the image
%   k - the number of random points
%Outputs:
%   points - A k x 2 array which contains random points
%Author: Nisal Jayaneththi

%Get the size of the image
[numOfRows, numOfCols, ~] = size(img);

%Generate k unique points (linear indicies) from 1 to the number of pixels
%Algorithm retrieved from: https://au.mathworks.com/help/matlab/ref/randper
%m.html
pointPositions = randperm(numOfRows*numOfCols, k);

%Find the row numbers for the points by dividing the position number by the
%number of rows and then multiplying by the number of rows and adding 1
%Algorithm Retrieved from: http://tipstrickshowtos.blogspot.com/2011/09/fas
%t-replacement-for-ind2sub.html
rows = ((pointPositions ./ numOfRows) - (floor(pointPositions ./ ...
    numOfRows)))* numOfRows + 1;

%Find the number of columns by dividing the pointPositions by the number of
%rows and then rounding up
cols = ceil(pointPositions / numOfRows);

%Create 2d array with rows and cols
points = [rows; cols];

%Transpose points into correct orientation and convert values to single
%from double
%Algorithm retrieved from: https://au.mathworks.com/help/matlab/ref/transpo
%se.html
points = single(transpose(points));

end