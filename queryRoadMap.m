%this script is to query path from start to goal.
%params
%start,goal: coordinates for start and goal points
%V,E: used to describe structure of roadmap, V is vertex and E is Edge
%oblist: obstacle list (consists of points of obstacle corners)
%return
%flag: to show if there is a shortest path from start to goal
%spath: if there is a shortest path, flag is true, and record points in
%shortest path in spath variable
function [flag,spath,cost]=queryRoadMap(start,goal,V,E,oblist)
%add start and goal to roadmap, in fact, I doubt if the start and goal point should
%connects all nodes in network, if consider the optimal one or
%completeness, I think we should add it fully to network, while it is
%really a waste of time and space
cnt=length(V);
for i=1:cnt
    startlinkflag=1;
    goallinkflag=1;
    for j=1:length(oblist)
             ob=oblist(j);
            if ~Link(start.x,start.y,V(i).x,V(i).y,ob.xmin,ob.xmax,ob.ymin,ob.ymax)
                startlinkflag=0;
                break;
            end
    end
    if startlinkflag
        E(i,cnt+1)=sqrt((start.x-V(i).x)^2+(start.y-V(i).y)^2);
        E(cnt+1,i)=E(i,cnt+1);
    else
         E(i,cnt+1)=0;
         E(cnt+1,i)=0;
    end
     for j=1:length(oblist)
             ob=oblist(j);
         if ~Link(goal.x,goal.y,V(i).x,V(i).y,ob.xmin,ob.xmax,ob.ymin,ob.ymax)
             goallinkflag=0;
            break;
         end
     end
    if goallinkflag
        E(i,cnt+2)=sqrt((goal.x-V(i).x)^2+(goal.y-V(i).y)^2);
        E(cnt+2,i)=E(i,cnt+2);
    else
         E(i,cnt+2)=0;
         E(cnt+2,i)=0;
    end
end
%link start and end
linkflag=1;
 for j=1:length(oblist)
             ob=oblist(j);
         if ~Link(goal.x,goal.y,start.x,start.y,ob.xmin,ob.xmax,ob.ymin,ob.ymax)
             linkflag=0;
            break;
         end
 end
if linkflag
     E(cnt+1,cnt+2)=sqrt((goal.x-start.x)^2+(goal.y-start.y)^2);
     E(cnt+2,cnt+1)=E(cnt+1,cnt+2);
else
     E(cnt+1,cnt+2)=0;
     E(cnt+2,cnt+1)=0;
end

%use Dijstra to compute the shortest path
[cost,spath]=dijkstra(E,cnt+1,cnt+2);
temp=spath;
spath=fliplr(spath);
spath=spath(2:length(spath)-1);
if find(spath>cnt)
    %fprintf('There is a problem in spath\n');
    spath(find(spath==cnt+1))=1;
end
if isinf(cost)
    flag=0;
else
    flag=1;
end
end