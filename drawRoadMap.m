%this scprit is written to draw roadmap
function drawRoadMap(V,E)
%draw milstones
for i=1:length(V)
    x(i)=V(i).x;
    y(i)=V(i).y;
end
plot(x,y,'.','LineWidth',2,'MarkerEdgeColor','k');
hold on;
%draw Lines
cnt=size(E,1);
for i=1:cnt
    for j=1:cnt
        if E(i,j)%there is a collision free line between (i,j)
            plot([V(i).x,V(j).x],[V(i).y,V(j).y],'r');
            hold on;
        end
    end
end

end