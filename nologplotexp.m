function [ax1,h1,h2,h3] = nologplotexp( maindir,ctldir,cthdir,desc )
%PLOTEXP Summary of this function goes here
%   Detailed explanation goes here

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
h1=bar(1,nbcoop/n,'blue');
%set(get(h1,'BaseLine'),'LineWidth',1);
%set(get(h1,'BaseLine'),'Visible','off');

%% Second order (mutdc)
h2=bar(ax1,2,nb2coop/n);
%set(get(h2,'BaseLine'),'LineWidth',1);
%set(get(h2,'BaseLine'),'Visible','off');
set(h2,'FaceColor',[0.2 0.8 0.4]);

%% Second order (mutcd)
h3=bar(ax1,3,nb2d/n,'red');
%set(get(h3,'BaseLine'),'Visible','off');
%set(get(h3,'BaseLine'),'LineWidth',1);

%% Pure cooperators error bar
c=[0 0 0];
if (nbcoop/n - stdcoop/n < st)
    he1=errorbar(ax1,1,nbcoop/n,nbcoop/n-st,stdcoop/n,'color',c,'LineWidth',lw);
else
    he1=errorbar(ax1,1,nbcoop/n,stdcoop/n,'color',c,'LineWidth',lw);
end
hee1=get(he1,'Children');
xx=get(hee1(2),'Xdata');
xx(4)=0.8;
xx(5)=1.2;
xx(7)=0.8;
xx(8)=1.2;
%set(hee1(2),'Xdata',xx);
set(hee1(2),'XData',[1 1 NaN 1 1 NaN 1 1 NaN])

%% Second order (mutdc) error bar
c=[0 0 0];
he2=errorbar(ax1,2,nb2coop/n,std2coop/n,'color',c,'LineWidth',lw);
hee2=get(he2,'Children');
xx=get(hee2(2),'Xdata');
xx(4)=1.8;
xx(5)=2.2;
xx(7)=1.8;
xx(8)=2.2;
%set(hee2(2),'Xdata',xx);
set(hee2(2),'XData',[2 2 NaN 2 2 NaN 2 2 NaN])

%% Second order (mutcd) error bar
c=[0 0 0];
he3=errorbar(ax1,3,nb2d/n,std2d/n,'color',c,'LineWidth',lw);
hee3=get(he3,'Children');
xx=get(hee3(2),'Xdata');
xx(4)=2.8;
xx(5)=3.2;
xx(7)=2.8;
xx(8)=3.2;
%set(hee3(2),'Xdata',xx);
set(hee3(2),'XData',[3 3 NaN 3 3 NaN 3 3 NaN])

%% Global
ylim(ax1,[st 1.2]);
xlim(ax1,[0.4 3.6]);
set(ax1,'Xtick',[]);
if ~strcmp(desc,'')
    title(desc);
end
hold off;
end

