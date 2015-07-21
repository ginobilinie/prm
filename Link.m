%This script is written to implement the Link function for robotics hw2
%target:Is the straight-line path between q and q¡¯ collision-free? in this function: I set
%the boundary points are collision free
%params
%xtest,ytest: coordinate of the test point
%xdest,ydes: coordinate of the destination point
%xmin,ymin: left, down point of rectangular obstacle
%xmax,ymax: right, up point of rectangular obstacle
%return
%isCollFree: is the test staight line collision free
function isCollFree=Link(xtest,ytest,xdes,ydes,xmin,xmax,ymin,ymax)
    isCollFree=1;
    %to judge if the line inside the rectangular
    minx=min(xtest,xdes);
    maxx=max(xtest,xdes);
    miny=min(ytest,ydes);
    maxy=max(ytest,ydes);
    if minx>=xmin&&maxx<=xmax&&miny>=ymin&&maxy<=ymax
        isCollFree=0;
    end
    %to judge if the segment will intersect with any of 4 edges, note, here
    %if one point is on 
    if segIntersection(xtest,ytest,xdes,ydes,xmin,ymin,xmin,ymax)||...
        segIntersection(xtest,ytest,xdes,ydes,xmin,ymin,xmax,ymin)||...
        segIntersection(xtest,ytest,xdes,ydes,xmin,ymax,xmax,ymax)||...
        segIntersection(xtest,ytest,xdes,ydes,xmax,ymin,xmax,ymax)
        isCollFree=0;
    end
return

%judge if two segments intersects
function res=segIntersection(px1,py1,px2,py2,qx1,qy1,qx2,qy2)
    res=0;% not intersect by default
    %from the view of point p1
    d1=(px2-px1)*(qy1-py1)-(qx1-px1)*(py2-py1);
    d2=(px2-px1)*(qy2-py1)-(qx2-px1)*(py2-py1);
    %from the point of q1
    d3=(qx2-qx1)*(py1-qy1)-(px1-qx1)*(qy2-qy1);
    d4=(qx2-qx1)*(py2-qy1)-(px2-qx1)*(qy2-qy1);
    
    %one point on another segment,here I only have to judge if p1,p2 is on
    %segment q1q2, as I have judge if the segment is inside the
    %rectangular, so the only way p1,p2 is on segment q1q2 is outside,
    %while outside is considered ok
    
    %two segments intersect
    if d1*d2<0&&d3*d4<0
        res=1;
    end
return
