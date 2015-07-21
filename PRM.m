%This script is to implement the PRM function
%params
%startpoint,goalpoint: a structure with x,y
%obstaclelist: list of obstacle, each obstacle consists of two
%points(down left and up right)
%n: number of milestones to sample
%m: m neareast for each point
%workspace: two points: down left and up right
%return
%sp: shortest path, consists of points
function [flag,spath,cost]=PRM(startpoint,goalpoint,obstaclelist,n,m,workspace)
%draw Obstacles
drawMap(obstaclelist,workspace,startpoint,goalpoint);
%learn phase: construct roadmap
[V,E]=constructRoadMap(n,workspace,obstaclelist,m);
%draw roadmap
drawRoadMap(V,E);
%query phase:
[flag,spath,cost]=queryRoadMap(startpoint,goalpoint,V,E,obstaclelist);
if ~flag
    fprintf('There is no path between start point and goal point\n');
    return;
end
drawSP(startpoint,goalpoint,V,spath,cost);
%draw the shortest path 
end