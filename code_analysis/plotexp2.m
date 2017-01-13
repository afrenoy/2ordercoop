function [] = plotexp2(data)
%PLOTEXP2 produces figure S4 (exp2, mutation rate between 0.001 and 0.1)

%% Global parameters
load('graphicparamsv1');
ini=-0.017;
fin=1.011;
saveh=0.07;
savev=0.1;

%% Main plot
plotexp(data);

%% Draw parameter zones
pa=patch(0.013+saveh/2+[ini 0.125 0.125 0.25 0.25 ini ini]*(1-saveh), 0.011+savev/2+[0.25 0.25 0.375 0.375 1 1 0.25]*(1-savev),[216.6667  230.0000  246.6667]/255,'LineStyle','none');
pb=patch(0.013+saveh/2+[ini 0.125 0.125 0.375 0.375 fin fin 0.25 0.25 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 1 1 0.375 0.375 0.25 0.25 0.125]*(1-savev),[226.6667 255 226.6667]/255,'LineStyle','none');
pc=patch(0.013+saveh/2+[ini fin fin 0.375 0.375 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0 0 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),[242.2222 214.4444 246.6667]/255,'LineStyle','none');

%% Export
print('-dpdf','-loose','data2');
close();
