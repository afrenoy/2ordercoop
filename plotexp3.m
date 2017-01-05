%PLOTEXP3 produces figure S2 (exp3, mutation rate between 0.001 and 0.5)

%% Global parameters
colorb1=[216.6667 230.0000 246.6667]/255; % Colors of the borders between parameter zones
colorb2=[226.6667 255 226.6667]/255;
colorb3=[242.2222 214.4444 246.6667]/255;
saveh=0.07; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.1; % What vertical space to leave at the bottom of the figure for 'global' labels
ini=-0.017;
fin=1.011;

%% Main plot
plotexp('~/data/evomut/exp3');

%% Draw parameter zones
pa=patch(0.013+saveh/2+[ini 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.375 0.375 1 1 0.375]*(1-savev),[216.6667  230.0000  246.6667]/255,'LineStyle','none');
pb=patch(0.013+saveh/2+[ini 0.125 0.125 0.75 0.75 fin fin 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.375 0.375 0.25]*(1-savev),[226.6667 255 226.6667]/255,'LineStyle','none');
pc=patch(0.013+saveh/2+[ini fin fin 0.75 0.75 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0]*(1-savev),[242.2222 214.4444 246.6667]/255,'LineStyle','none');

%% Export and fix
print('-depsc','-loose','data3');
print('-dpdf','-loose','data3');