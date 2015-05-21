function [ax1,h1,h4,h5] = plotcontrollog( maindir,ctldir,cthdir,desc )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

mainfile=ls([maindir '/*.mat']);
ctlfile=ls([ctldir '/*.mat']);
cthfile=ls([cthdir '/*.mat']);

n=10000;
st=0.0005;
lw=2;

mainfile(numel(mainfile))='';
ctlfile(numel(ctlfile))='';
cthfile(numel(cthfile))='';

[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,nbctl,stdctl,nbcth,stdcth,~,~,~,~] = computefromexp( mainfile, ctlfile, cthfile );


%% Pure cooperators
hold on;
h1=bar(1,nbcoop/n);
set(h1,'BaseValue',st);
set(h1,'FaceColor',[0.169 0.294 0.435]);
ax1=gca;

%% control bars
h4=bar(2,nbctl/n,'FaceColor',[0.5 0 0.7]);
h5=bar(3,nbcth/n,'FaceColor',[0 0.7 0.7]);

%% Error bars
c=[0 0 0];
line([1 1],[nbcoop/n-stdcoop/n nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw);
%if (nbcoop/n - stdcoop/n < st)
%    line([1 1],[st nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw);
%else
%    line([1 1],[nbcoop/n-stdcoop/n nbcoop/n+stdcoop/n],'Color',c,'LineWidth',lw);
%end

line([2 2],[nbctl/n-stdctl/n nbctl/n+stdctl/n],'Color',c,'LineWidth',lw);
line([3 3],[nbcth/n-stdcth/n nbcth/n+stdcth/n],'Color',c,'LineWidth',lw);

%% Global
if (nbcoop/n<0.1) || (nbctl/n<0.1)
    set(gca,'Yscale','log');
    ylim(gca,[st 1]);
    set(gca,'Ytick',[0.001,0.01,0.1]);
else
    ylim(gca,[0 1.2]);
    set(gca,'Ytick',[0 0.5 1]);
end

xlim(gca,[0.4 3.6]);
set(gca,'Xtick',[]);
if ~strcmp(desc,'')
    title(desc);
end
hold off;
end

