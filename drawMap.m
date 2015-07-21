%draw oblist and workspace
function drawMap(oblist,ws,start,goal)
for i=1:length(oblist)
   ob = oblist(i);
   x=[ob.xmin,ob.xmin,ob.xmax,ob.xmax];
   y=[ob.ymin,ob.ymax,ob.ymax,ob.ymin];
   patch(x,y,'b');
   hold on
end
boundx=[ws.xmin,ws.xmin,ws.xmax,ws.xmax];
boundy=[ws.ymin,ws.ymax,ws.ymax,ws.ymin];
plot(boundx,boundy,'b','LineWidth',2);
%
x=0:22;y=0:22;
plot(x,meshgrid(y,x),'k')
hold on
plot(meshgrid(x,y),y,'k')
hold on;
%axis([ws.xmin-5, ws.xmax+5 ,ws.ymin-5,ws.ymin+5]);
plot([start.x,goal.x],[start.y,goal.y],'b*');
end