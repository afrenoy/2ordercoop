%% Draw a subplot for each parameter combination

n=0;
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

hblank=0.015; % What horizontal space to leave between two subplots
vblank=0.015; % What vertical space to leave between two subplots

saveh=0.07; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.1; % What vertical space to leave at the bottom of the figure for 'global' labels

hright=0.01;

% Will be used to infer different zones
nbc=zeros(8,8);
nb2c=zeros(8,8);

nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        n=n+1;
        nc=nc+1;
        desc=['c = ' num2str(c) ', m = ' num2str(m)];
        d1=['~/data/evomut/exp3/c' num2str(c) 'mexp' num2str(m)];
        d2=['~/data/evomut/exp3_ctl/c' num2str(c) 'mexp' num2str(m)];
        d3=['~/data/evomut/exp3_cth/c' num2str(c) 'mexp' num2str(m)];
        left=saveh+(nc*(1-saveh-hright)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh-hright)/numel(listec)-hblank;
        height=(1-savev)/numel(listem)-vblank;
        subplot('Position',[left bottom width height]);
        [ax1,h1,h2,h3,nbcoop,nb2coop]=nologplotexp(d1,d2,d3,'');
        nbc(nm,nc)=nbcoop;
        nb2c(nm,nc)=nb2coop;
        if c==min(listec)
            set(ax1,'YAxisLocation','left');
            set(ax1,'color','none');
            set(ax1,'TickLength',[0.03 0.03]);
            set(ax1,'LineWidth',1);
            set(ax1,'Box','off');
        elseif c==max(listec)
            set(ax1,'YAxisLocation','right');
            set(ax1,'color','none');
            set(ax1,'TickLength',[0.03 0.03]);
            set(ax1,'LineWidth',1);
            set(ax1,'Box','off');
        else
            set(ax1,'YColor','none');
            set(ax1,'color','none');
            set(ax1,'YTick',[]);
            set(ax1,'Box','off');
            set(ax1,'LineWidth',1);
        end
        set(ax1,'Box','off');
        set(ax1,'FontSize',18);
    end
end
z=(nbc<5000) & (nb2c>5000);
zz=z(8:-1:1,1:8); % Help to identify the green zone

%% Print parameter values on the left and the bottom

leftax=axes('Position',[0 savev saveh 1],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
bottomax=axes('Position',[saveh 0 1 savev],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
nm=0;
for m=listem
    nm=nm+1;
    t=text(0.5,(nm*(1-savev)-1)/numel(listem)+vblank/2+((1-savev)/numel(listem)-vblank)/2-0.02,['m = ' num2str(m)],'FontSize',18,'FontWeight','bold','rotation',90);
    set(t,'Parent',leftax);
end

nc=0;
for c=listec
    nc=nc+1;
    t=text((nc*(1-saveh)-1)/numel(listec)+hblank/2+((1-saveh)/numel(listec)-hblank)/2-0.01,0.75,['c = ' num2str(c)],'FontSize',18,'FontWeight','bold');
    set(t,'Parent',bottomax);
end

%% Print parameter names
new=axes('Position',[0.015 0.025 1-hright 1]);
set(new, 'color', 'none');
set(new, 'XTick',[]);
set(new, 'YTick',[]);
set(new, 'Xlim',[0 1]);
set(new, 'Ylim',[0 1]);
set(new,'Visible','off');
text(0.45,0.025,'Cooperation cost (c)','FontSize',22);
text(-0.005,0.45,'Selection pressure (m)','FontSize',22,'rotation',90);

%% Make figure bigger for export
set(gcf,'units','normalized','outerposition',[0 0 0.6 1]);
set(gcf, 'PaperPositionMode', 'auto');

%% Add a global legend on bottom
hl=legend([h1 h2 h3],{'Cooperation locus: proportion of allele C   m','D\rightarrow C rate locus: proportion of allele H   m','C\rightarrow D rate locus: proportion of allele H   m'},'FontSize',20,'Orientation','horizontal','Box','off');
pl=get(hl,'Position');
pl(1)=0.03;
pl(2)=0.0;
pl(3)=1;
set(hl,'Position',pl)

%% Draw parameter zones
ini=-0.017;
fin=1.011;
pa=line(0.013+saveh/2+[ini 0.125 0.125 0.25 0.25 ini ini]*(1-saveh), 0.011+savev/2+[0.25 0.25 0.375 0.375 1 1 0.25]*(1-savev),'color',[0 0 1],'LineStyle',':');
pb=line(0.013+saveh/2+[ini 0.125 0.125 0.375 0.375 fin fin 0.25 0.25 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 1 1 0.375 0.375 0.25 0.25 0.125]*(1-savev),'color',[0 1 0],'LineStyle',':');
pc=line(0.013+saveh/2+[ini fin fin 0.375 0.375 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0 0 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),'color',[1 0 0],'LineStyle',':');


%% Export and fix
print('-depsc','-loose','data2');