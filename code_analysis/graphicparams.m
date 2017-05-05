C=[0.169 0.294 0.435]*10/9; % Colors of the bars
HDC=[0.176 0.533 0.176]*10/9;
HCD=[0.667 0.224 0.224]*10/9;
colorb1=[216.6667 230.0000 246.6667]/255; % Colors of the borders between parameter zones
colorb2=[226.6667 255 226.6667]/255;
colorb3=[242.2222 214.4444 246.6667]/255;
scaling=3;
fs1=6*scaling;
fs2=6*scaling;
fs3=8*scaling;
lw1=0.3*scaling; % Edges of bar graphs, axes, ...
lw2=0.6*scaling; % Error bars
savehr=0.03;
hright=0.01;

hblank=0.015; % What horizontal space to leave between two subplots
vblank=0.015; % What vertical space to leave between two subplots
save('graphicparamsv1')
