function [] = plotexp1async(data)
%PLOTEXP1STERILE produces supplementary control with asynchronous simulation (exp1, mutation rate between 0.001 and 0.01)

%% Global parameters
load('graphicparamsv1');
ini=-0.017;
fin=1.011;
saveh=0.07;
savev=0.1;

%% Main plot
plotexp(data);

%% Draw parameter zones
pa=patch(0.013+saveh/2+[ini 0.125 0.125 0.25 0.25 0.375 0.375 0.25 0.25 ini ini]*(1-saveh), 0.011+savev/2+[0. 0. 0.25 0.25 0.5 0.5 0.75 0.75 1 1 0.]*(1-savev),colorb1,'LineStyle','none');
pb=patch(0.013+saveh/2+[0.125 0.25 0.25 0.75 0.75 fin fin 0.25 0.25 0.375 0.375 0.25 0.25 0.125 0.125]*(1-saveh), 0.011+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 1 1 0.75 0.75 0.5 0.5 0.25 0.25 0.125]*(1-savev),colorb2,'LineStyle','none');
pc=patch(0.013+saveh/2+[0.125 fin fin 0.75 0.75 0.25 0.25 0.125 0.125]*(1-saveh), 0.011+savev/2+[0 0 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),colorb3,'LineStyle','none');

%% Export
print('-dpdf','-loose','data1async');
close();
