%This script is written to generate random points, to simply it, I use rand
%to generate points following uniform distribution, note, the points is
%required to be collision free
%params
%n: number of points to sample
%ws: workspace
%oblist: obstacle list
%k: k-nearst neighbor
function [points,edges]=constructRoadMap(n,ws,oblist,k)
cnt=0;
% for i=1:n
% points(i).x=0;
% points(i).y=0;
% end
edges=zeros(n,n);%if there is no edge between two points, it is zero by default
while cnt<n
     x = ws.xmin + (ws.xmax-ws.xmin)*rand;
     y = ws.ymin + (ws.ymax-ws.ymin)*rand;
     flag=1;
     for i=1:length(oblist)
         ob=oblist(i);
         if ~Clear(x,y,ob.xmin,ob.xmax,ob.ymin,ob.ymax)
             flag=0;
             break;
         end
     end
     if flag&&cnt>0
         [kindex,kdist]=getKNNpoints(x,y,points,k,cnt);
         linkflag=1;
         for i=1:length(kindex)
             ind=kindex(i);
             for j=1:length(oblist)
                 ob=oblist(j);
                if ~Link(x,y,points(ind).x,points(ind).y,ob.xmin,ob.xmax,ob.ymin,ob.ymax)
                    linkflag=0;
                    break;
                end
             end
             if linkflag
                 edges(ind,cnt+1)=kdist(i);%the current vetex is stored in length(kindex)+1
                 edges(cnt+1,ind)=kdist(i);
             end
         end
     end
     if flag%collison free
         cnt=cnt+1;
         points(cnt).x=x;
         points(cnt).y=y; 
     else
        continue;
     end
end
end

%get the knn points to (x,y), return index of knn-points
%note: I am not sure if the k neighbours should be link-collision free
%now I take it as not necessary
function [kindex,kdist]=getKNNpoints(x,y,points,k,cnt)
    for i=1:length(points)
        dist(i)=sqrt((x-points(i).x)^2+(y-points(i).y)^2);
    end 
    
    if cnt<=k
        kindex=1:cnt;
        kdist=dist(1:cnt);
        return
    end
  
    [newdist,index]=sort(dist);
    kdist=newdist(1:k);
    kindex=index(1:k);
    %ps=points(index);
end