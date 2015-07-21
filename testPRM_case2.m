%This script is to test my PRM function
function testPRM_case2()
workspace.xmin=0;workspace.xmax=22;workspace.ymin=0;workspace.ymax=22;
oblist(1).xmin=4;oblist(1).xmax=16;oblist(1).ymin=0;oblist(1).ymax=10;
oblist(2).xmin=14;oblist(2).xmax=22;oblist(2).ymin=3;oblist(2).ymax=9;
oblist(3).xmin=6;oblist(3).xmax=13;oblist(3).ymin=14;oblist(3).ymax=22;
start.x=2;start.y=2;goal.x=14;goal.y=21;
onlyrun1time=1;
if onlyrun1time
n=300;
m=5;
[flag,spath]=PRM(start,goal,oblist,n,m,workspace);
else
ns=[5,10,20,30,40,50,50,70,80,90,100,150,200,300,400,500,500,600,700,800,900,1000,1200,1500];
m=5;%m is fixed here 
for i=1:length(ns);
    n=ns(i);
    sum=0;
    for iter=1:10%
        [flag,spath,cost]=PRM(start,goal,oblist,n,m,workspace);
        sum=sum+cost;
    end
    c(i)=sum/10;
    hold off;
end
figure();
plot(ns,c);
title('case-2: relationship between shortest path length and samples n');
xlabel('samples: n');
ylabel('shortest path length');
saveas(gcf,'cost_case2.png');
save('cost_case2.mat','ns','c');
end
end