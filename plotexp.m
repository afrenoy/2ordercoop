function [  ] = plotexp( maindir,ctldir,cthdir,desc )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

mainfile=ls([maindir '/*.mat']);
ctlfile=ls([ctldir '/*.mat']);
cthfile=ls([cthdir '/*.mat']);

n=10000;
st=0.0005;

mainfile(numel(mainfile))='';
ctlfile(numel(ctlfile))='';
cthfile(numel(cthfile))='';

[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,nbctl,stdctl,nbcth,stdcth,m1,m2,s1,s2] = computefromexp( mainfile, ctlfile, cthfile );


%% Pure cooperators
hold on;
h1=bar(1,nbcoop/n,'blue');
set(h1,'BaseValue',st);
ax1=gca;
ax2=axes('Position',get(ax1,'Position'),'XAxisLocation','bottom','YAxisLocation','right','Color','none','XColor','k','YColor','k');

%% Second order (mutdc)
h2=bar(ax1,2,nb2coop/n);
set(h2,'FaceColor',[0.2 0.8 0.4]);
set(h2,'BaseValue',0);
set(h2,'Parent',ax2);

%% Second order (mutcd)
h3=bar(ax1,3,nb2d/n,'red');
set(h3,'BaseValue',0);
set(h3,'Parent',ax2);

%% Pure cooperators error bar
he1=errorbar(ax1,1,nbcoop/n,stdcoop/n,'color',[0.3 0.6 1],'LineWidth',5);
hee1=get(he1,'Children');
xx=get(hee1(2),'Xdata');
xx(4)=0.8;
xx(5)=1.2;
xx(7)=0.8;
xx(8)=1.2;
set(hee1(2),'Xdata',xx);

%% Second order (mutdc) error bar
he2=errorbar(ax1,2,nb2coop/n,std2coop/n,'color',[0.5 1 0.5],'LineWidth',5);
set(he2,'Parent',ax2);
hee2=get(he2,'Children');
xx=get(hee2(2),'Xdata');
xx(4)=1.8;
xx(5)=2.2;
xx(7)=1.8;
xx(8)=2.2;
set(hee2(2),'Xdata',xx);

%% Second order (mutcd) error bar
he3=errorbar(ax1,3,nb2d/n,std2d/n,'color',[1 0.5 0.5],'LineWidth',5);
set(he3,'Parent',ax2);
hee3=get(he3,'Children');
xx=get(hee3(2),'Xdata');
xx(4)=2.8;
xx(5)=3.2;
xx(7)=2.8;
xx(8)=3.2;
set(hee3(2),'Xdata',xx);

%% Pure cooperators control lines
line([0.6 1.4],[nbctl/n nbctl/n],'LineStyle','--','LineWidth',5,'color',[0.5 0.5 0.5],'Parent',ax1);
line([0.6 1.4],[nbcth/n nbcth/n],'LineStyle',':','LineWidth',5,'color','black','Parent',ax1);

%% Global
set(ax1,'Yscale','log');
ylim(ax1,[st 1]);
ylim(ax2,[0 1]);

xlim(ax1,[0.5 3.5]);
xlim(ax2,[0.5 3.5]);

%set(ax1,'Xtick',[1]);
%set(ax2,'Xtick',[2]);
%set(ax1,'XtickLabel',{'pure cooperators'});
%set(ax2,'XtickLabel',{'2nd order cooperators'});
set(ax1,'Xtick',[]);
set(ax2,'Xtick',[]);
ylabel(ax1,'Pure cooperators (blue)','FontSize',12);
ylabel(ax2,'2nd order (green/red)','FontSize',12);
title(desc);
hold off;
end

