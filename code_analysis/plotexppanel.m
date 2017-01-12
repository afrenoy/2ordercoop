function [ax1,h1,h2,h3,nbcoop,nb2coop] = plotexppanel( maindir)
%PLOTEXPPANEL Plot a pannel (a single parameter combination) of a standard
%experiment (figs 1, S1, S2)
%   Detailed explanation goes here

%% Parameters
load('graphicparamsv1');

%% Computing data
n=10000;
st=0;

mainfile=ls([maindir '/*.mat']);
mainfile(numel(mainfile))='';
[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,~,~,~,~,~,~,~,~] = computefromexp(mainfile);

%% Pure cooperators
hold on;
ax1=gca;
h1=bar(ax1,1,nbcoop/n,'LineWidth',lw1);
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
hold off;
end

