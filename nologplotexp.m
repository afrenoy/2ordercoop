function [ax1,h1,h2,h3,h4,h5] = nologplotexp( maindir,ctldir,cthdir,desc )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

mainfile=ls([maindir '/*.mat']);
ctlfile=ls([ctldir '/*.mat']);
cthfile=ls([cthdir '/*.mat']);

n=10000;
st=0;

mainfile(numel(mainfile))='';
ctlfile(numel(ctlfile))='';
cthfile(numel(cthfile))='';

[nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,nbctl,stdctl,nbcth,stdcth,m1,m2,s1,s2] = computefromexp( mainfile, ctlfile, cthfile );


%% Pure cooperators
hold on;
h1=bar(1,nbcoop/n,'blue');
%set(h1,'BaseValue',st);
ax1=gca;

%% Second order (mutdc)
h2=bar(ax1,2,nb2coop/n);
set(h2,'FaceColor',[0.2 0.8 0.4]);
%set(h2,'BaseValue',0);

%% Second order (mutcd)
h3=bar(ax1,3,nb2d/n,'red');
%set(h3,'BaseValue',0);

%% Pure cooperators error bar
if (nbcoop/n - stdcoop/n < st)
    he1=errorbar(ax1,1,nbcoop/n,nbcoop/n-st,stdcoop/n,'color',[0.3 0.6 1],'LineWidth',5);
else
    he1=errorbar(ax1,1,nbcoop/n,stdcoop/n,'color',[0.3 0.6 1],'LineWidth',5);
end
hee1=get(he1,'Children');
xx=get(hee1(2),'Xdata');
xx(4)=0.8;
xx(5)=1.2;
xx(7)=0.8;
xx(8)=1.2;
set(hee1(2),'Xdata',xx);
%uistack(he1,'top');

%% Second order (mutdc) error bar
he2=errorbar(ax1,2,nb2coop/n,std2coop/n,'color',[0.5 1 0.5],'LineWidth',5);
hee2=get(he2,'Children');
xx=get(hee2(2),'Xdata');
xx(4)=1.8;
xx(5)=2.2;
xx(7)=1.8;
xx(8)=2.2;
set(hee2(2),'Xdata',xx);

%% Second order (mutcd) error bar
he3=errorbar(ax1,3,nb2d/n,std2d/n,'color',[1 0.5 0.5],'LineWidth',5);
hee3=get(he3,'Children');
xx=get(hee3(2),'Xdata');
xx(4)=2.8;
xx(5)=3.2;
xx(7)=2.8;
xx(8)=3.2;
set(hee3(2),'Xdata',xx);

%% Pure cooperators control lines
%h4=line([0.6 1.4],[nbctl/n nbctl/n],'LineStyle',':','LineWidth',4,'color',[0.5 0.5 0.5],'Parent',ax1);
%h5=line([0.6 1.4],[nbcth/n nbcth/n],'LineStyle',':','LineWidth',4,'color','black','Parent',ax1);
h4=0;
h5=0;

%% Global
%set(ax1,'Yscale','log');
ylim(ax1,[st 1.2]);

xlim(ax1,[0.5 3.5]);

%set(ax1,'Xtick',[1]);
%set(ax1,'XtickLabel',{'pure cooperators'});
set(ax1,'Xtick',[]);
%set(ax1,'Ytick',[0.001,0.01,0.1,1]);
%ylabel(ax1,'Pure cooperators (blue)','FontSize',12);
if ~strcmp(desc,'')
    title(desc);
end
hold off;
end

