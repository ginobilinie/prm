%This script is to draw shortest path
function drawSP(startpoint,goalpoint,V,spath,cost)
    cnt=length(spath);
    plot([startpoint.x,V(spath(1)).x],[startpoint.y,V(spath(1)).y],'g','LineWidth',8);
    hold on;
    for i=1:cnt-1
        plot([V(spath(i)).x,V(spath(i+1)).x],[V(spath(i)).y,V(spath(i+1)).y],'g','LineWidth',8);
        hold on;
    end
    plot([V(spath(cnt)).x,goalpoint.x],[V(spath(cnt)).y,goalpoint.y],'g','LineWidth',8);
    title(sprintf('PRM algorithm simulation: the cost is %d and n=%d',cost,300));
    %saveas(gcf,sprintf('prm-testcase1.png'));
    hold off;
end