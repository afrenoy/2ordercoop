%PLOTEXP1RELATEDNESS produces figure 3 (relatedness for exp1)

%% Global parameters
load('graphicparamsv1');
saveh=0.07;
savev=0.1;
savehr=0.03;
ini=-0.035;
fin=1.03;

%% Main plot
plotrelatedness('~/data/evomut/exp1.mat')

%% Draw parameter zones
pa=patch(0.01+saveh/2+[ini 0.125 0.125 0.25 0.25 0.375 0.375 0.25 0.25 ini ini]*(1-saveh-savehr), 0.01+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 0.75 0.75 1 1 0.25]*(1-savev),colorb1,'LineStyle','none');
pb=patch(0.01+saveh/2+[ini 0.125 0.125 0.375 0.375 0.875 0.875 fin fin 0.25 0.25 0.375 0.375 0.25 0.25 0.125 0.125 ini ini]*(1-saveh-savehr), 0.01+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.75 0.75 0.5 0.5 0.375 0.375 0.25 0.25 0.125]*(1-savev),colorb2,'LineStyle','none');
pc=patch(0.01+saveh/2+[ini fin fin 0.875 0.875 0.375 0.375 0.125 0.125 ini ini]*(1-saveh-savehr), 0.01+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),colorb3,'LineStyle','none');

%% Export
print('-dpdf','-loose','data1relatedness');
close();