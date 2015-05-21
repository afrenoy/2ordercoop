function [ax1,h1,h2,h3] = nologplotexp( maindir,ctldir,cthdir,desc )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

%% Parameters
C=[0.169 0.294 0.435];
HDC=[0.176 0.533 0.176];
HCD=[0.667 0.224 0.224];

%% Computing data
mainfile=ls([maindir '/*.mat']);
ctlfile=ls([ctldir '/*.mat']);
cthfile=ls([cthdir '/*.mat']);

n=10000;
st=0;
lw=2;

mainfile(numel(mainfile))='';
ctlfile(numel(ctlfile))='';
cthfile(numel(cthfile))='';

[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,~,~,~,~,~,~,~,~] = computefromexp( mainfile, ctlfile, cthfile );


%% Pure cooperators
hold on;
ax1=gca;
set(ax1,'LineWidth',1);
h1=bar(ax1,1,nbcoop/n);
set(h1,'FaceColor',C)
%set(get(h1,'BaseLine'),'LineWidth',1);
%set(get(h1,'BaseLine'),'Visible','off');

%% Second order (mutdc)
h2=bar(ax1,2,nb2coop/n);
%set(get(h2,'BaseLine'),'LineWidth',1);
%set(get(h2,'BaseLine'),'Visible','off');
set(h2,'FaceColor',HDC);

%% Second order (mutcd)
h3=bar(ax1,3,nb2d/n);
set(h3,'FaceColor',HCD);
%set(get(h3,'BaseLine'),'Visible','off');
%set(get(h3,'BaseLine'),'LineWidth',1);

%% Error bars
c=[0 0 0];
if (nbcoop/n - stdcoop/n < st)
    line([1 1],[st nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw);
else
    line([1 1],[nbcoop/n-stdcoop/n nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw);
end

line([2 2],[nb2coop/n-std2coop/n nb2coop/n+std2coop/n],'Color',c,'LineWidth',lw);
line([3 3],[nb2d/n-std2d/n nb2d/n+std2d/n],'Color',c,'LineWidth',lw);

%% Global
ylim(ax1,[st 1.2]);
xlim(ax1,[0.4 3.6]);
set(ax1,'Xtick',[]);
if ~strcmp(desc,'')
    title(desc);
end
hold off;
end

