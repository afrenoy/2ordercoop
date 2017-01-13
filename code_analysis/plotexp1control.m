function [] = plotexp1control(data,datal,datah)
%PLOTEXP1CONTROL produces figure 2 (exp1, control enforcing mutation rates)

%% Global parameters
load('graphicparamsv1');
ini=-0.06;
fin=1.06;
saveh=0.11;
savev=0.16;

%% Main plot
plotcontrol(data,datal,datah);

%% Draw parameter zones
pa=patch(0.025+saveh/2+[ini 0.125 0.125 0.25 0.25 0.375 0.375 0.25 0.25 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 0.75 0.75 1 1 0.25]*(1-savev),[216.6667 230.0000 246.6667]/255,'LineStyle','none');
pb=patch(0.025+saveh/2+[ini 0.125 0.125 0.375 0.375 0.875 0.875 fin fin 0.25 0.25 0.375 0.375 0.25 0.25 0.125 0.125 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.75 0.75 0.5 0.5 0.375 0.375 0.25 0.25 0.125]*(1-savev),[226.6667 255 226.6667]/255,'LineStyle','none');
pc=patch(0.025+saveh/2+[ini fin fin 0.875 0.875 0.375 0.375 0.125 0.125 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),[242.2222 214.4444 246.6667]/255,'LineStyle','none');

%% Export
print('-dpdf','-loose','data1control');
close();
