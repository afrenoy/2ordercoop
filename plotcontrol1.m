%% Global parameters
scaling=3;
fs1=6*scaling;
fs2=6*scaling;
fs3=8*scaling;
lw1=0.3*scaling; % Edges of bar graphs, axes, ...
lw2=0.6*scaling; % Error bars
hblank=0.015; % What horizontal space to leave between two subplots
vblank=0.015; % What vertical space to leave between two subplots
saveh=0.11; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.16; % What vertical space to leave at the bottom of the figure for 'global' labels
savehr=0.03;
hright=0.01;
ini=-0.06;
fin=1.06;

%% Main plot
plotcontrol('~/data/evomut/exp1','~/data/evomut/exp1_ctl','~/data/evomut/exp1_cth');

%% Draw parameter zones
pa=patch(0.025+saveh/2+[ini 0.125 0.125 0.25 0.25 0.375 0.375 0.25 0.25 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 0.75 0.75 1 1 0.25]*(1-savev),[216.6667 230.0000 246.6667]/255,'LineStyle','none');
pb=patch(0.025+saveh/2+[ini 0.125 0.125 0.375 0.375 0.875 0.875 fin fin 0.25 0.25 0.375 0.375 0.25 0.25 0.125 0.125 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.75 0.75 0.5 0.5 0.375 0.375 0.25 0.25 0.125]*(1-savev),[226.6667 255 226.6667]/255,'LineStyle','none');
pc=patch(0.025+saveh/2+[ini fin fin 0.875 0.875 0.375 0.375 0.125 0.125 ini ini]*(1-saveh-savehr), 0.035+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),[242.2222 214.4444 246.6667]/255,'LineStyle','none');

%% Export
print('-depsc','-loose','data1muteffect');
print('-dpdf','-loose','data1muteffect');