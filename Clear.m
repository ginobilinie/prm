%This script is written to implement the Clear function for robotics hw2
%target:Is configuration q collision free or not? in this function: I set
%the boundary points are collision free
%params
%xtest,ytest: coordinate of the test point
%xmin,ymin: left, down point of rectangular obstacle
%xmax,ymax: right, up point of rectangular obstacle
%return
%isCollFree: is the test point collision free
function isCollFree=Clear(xtest,ytest,xmin,xmax,ymin,ymax)
    isCollFree=1;
    if xmin<xtest&&xtest<xmax&&ymin<ytest&&ytest<ymax
        isCollFree=0;
    end
end
