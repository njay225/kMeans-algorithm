function d = SquaredDistance(p1, p2)
%This function takes in 2 arrays each representing a point in 3D space and
%then returns the squared distance between them.
%Inputs:
%   p1 - the first point which is a 1x3, 3x1 or 1x1x3 array
%   p2 - the second point whcih is a 1x3, 3x1 or 1x1x3 array
%Output:
%   d - the squared distance between p1 and p2
%Author: Nisal Jayaneththi

%Calculate the squared distance between the two points by squaring the
%difference between values in each array and summing them
d = sum((p1 - p2).^2);

end
