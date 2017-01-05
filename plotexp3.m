%PLOTEXP3 produces figure S2 (exp3, mutation rate between 0.001 and 0.5)

%% Global parameters
load('graphicparamsv1');
ini=-0.017;
fin=1.011;
saveh=0.07;
savev=0.1;

%% Main plot
plotexp('~/data/evomut/exp3');

%% Draw parameter zones
pa=patch(0.013+saveh/2+[ini 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.375 0.375 1 1 0.375]*(1-savev),[216.6667  230.0000  246.6667]/255,'LineStyle','none');
pb=patch(0.013+saveh/2+[ini 0.125 0.125 0.75 0.75 fin fin 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.375 0.375 0.25]*(1-savev),[226.6667 255 226.6667]/255,'LineStyle','none');
pc=patch(0.013+saveh/2+[ini fin fin 0.75 0.75 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0]*(1-savev),[242.2222 214.4444 246.6667]/255,'LineStyle','none');

%% Export
print('-depsc','-loose','data3');
print('-dpdf','-loose','data3');