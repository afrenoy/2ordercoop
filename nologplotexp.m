function [ax1,h1,h2,h3,nbcoop,nb2coop] = nologplotexp( maindir,ctldir,cthdir,desc, lw1,lw2 )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

%% Parameters
C=[0.169 0.294 0.435]*10/9;
HDC=[0.176 0.533 0.176]*10/9;
HCD=[0.667 0.224 0.224]*10/9;

%% Computing data
mainfile=ls([maindir '/*.mat']);
ctlfile=ls([ctldir '/*.mat']);
cthfile=ls([cthdir '/*.mat']);

n=10000;
st=0;

mainfile(numel(mainfile))='';
ctlfile(numel(ctlfile))='';
cthfile(numel(cthfile))='';

[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,~,~,~,~,~,~,~,~] = computefromexp( mainfile, ctlfile, cthfile );


%% Pure cooperators
hold on;
ax1=gca;
%set(ax1,'LineWidth',lw1);
h1=bar(ax1,1,nbcoop/n,'LineWidth',lw1);
%h1=bar(ax1,1,nbcoop/n,'LineStyle','none');
uistack(h1,'bottom');
set(h1,'FaceColor',C);

%% Second order (mutdc)
h2=bar(ax1,2,nb2coop/n);
set(h2,'FaceColor',HDC);

%% Second order (mutcd)
h3=bar(ax1,3,nb2d/n);
set(h3,'FaceColor',HCD);

%% Error bars
c=[0 0 0];
if (nbcoop/n - stdcoop/n < st)
    line([1 1],[st nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw2);
else
    line([1 1],[nbcoop/n-stdcoop/n nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw2);
end

line([2 2],[nb2coop/n-std2coop/n nb2coop/n+std2coop/n],'Color',c,'LineWidth',lw2);
line([3 3],[nb2d/n-std2d/n nb2d/n+std2d/n],'Color',c,'LineWidth',lw2);

%% Global
ylim(ax1,[st 1.2]);
xlim(ax1,[0.4 3.6]);
set(ax1,'Xtick',[]);
if ~strcmp(desc,'')
    title(desc);
end
hold off;
end

