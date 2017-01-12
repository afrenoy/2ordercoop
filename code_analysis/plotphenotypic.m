function [] = plotphenotypic( datadirmut, datadirphenotypic)

%% Global parameters
load('graphicparamsv1');
HDCgen=[0.176 0.533 0.176]*10/9;
HDC=[0.1 0.2 0.1]*10/9;
saveh=0.07;
savev=0.1;

nindiv=10000;

%% Draw a subplot for each parameter combination

n=0;
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        n=n+1;
        nc=nc+1;
        d1=[datadirphenotypic '/c' num2str(c) 'mexp' num2str(m)];
        d1gen=[datadirmut '/c' num2str(c) 'mexp' num2str(m)];
        left=saveh+(nc*(1-saveh-hright)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh-hright)/numel(listec)-hblank;
        height=(1-savev)/numel(listem)-vblank;
        subplot('Position',[left bottom width height]);
        f1=ls([d1 '/*.mat']);
        f1(numel(f1))='';
        f1gen=ls([d1gen '/*.mat']);
        f1gen(numel(f1gen))='';
        [~,nb2coop,~,~,std2coop,~,~,~,~,~,~,~,~,~] = computefromexp( f1);
        [~,nb2coopgen,~,~,std2coopgen,~,~,~,~,~,~,~,~,~] = computefromexp( f1gen);
        hold on;
        ax1=gca;
        h1=bar(ax1,1,nb2coop/nindiv);
        set(h1,'FaceColor',HDC);
        h2=bar(ax1,2,nb2coopgen/nindiv);
        set(h2,'FaceColor',HDCgen);
        line([1 1],[nb2coop/nindiv-std2coop/nindiv nb2coop/nindiv+std2coop/nindiv],'Color',[0 0 0],'LineWidth',lw2);
        line([2 2],[nb2coopgen/nindiv-std2coopgen/nindiv nb2coopgen/nindiv+std2coopgen/nindiv],'Color',[0 0 0],'LineWidth',lw2);
        ylim(ax1,[0 1.2]);
        xlim(ax1,[0.4 2.6]);
        set(ax1,'Xtick',[]);
        hold off;
        if c==min(listec)
            set(ax1,'YAxisLocation','left','color','none','TickLength',[0.03 0.03],'LineWidth',lw1,'Box','off','YTick',[0 1],'YMinorTick','on');
        elseif c==max(listec)
            set(ax1,'YAxisLocation','right','color','none','TickLength',[0.03 0.03],'LineWidth',lw1,'Box','off','YTick',[0 1],'YMinorTick','on');
        else
            set(ax1,'YColor','none','color','none','YTick',[],'Box','off','LineWidth',lw1);
        end
        set(ax1,'FontSize',fs1);
    end
end

%% Print parameter values on the left and the bottom
leftax=axes('Position',[0 savev saveh 1],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
bottomax=axes('Position',[saveh 0 1 savev],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
nm=0;
for m=listem
    nm=nm+1;
    t=text(0.4,(nm*(1-savev)-1)/numel(listem)+vblank/2+((1-savev)/numel(listem)-vblank)/2-0.04,['m = ' num2str(m)],'FontSize',fs1,'FontWeight','normal','rotation',90);
    set(t,'Parent',leftax);
end

nc=0;
for c=listec
    nc=nc+1;
    t=text((nc*(1-saveh)-1)/numel(listec)+hblank/2+((1-saveh)/numel(listec)-hblank)/2-0.05,0.65,['c = ' num2str(c)],'FontSize',fs1,'FontWeight','normal');
    set(t,'Parent',bottomax);
end

%% Create axes for labels and parameter names
new=axes('Position',[0.015 0.025 1-hright 1]);
set(new, 'color', 'none');
set(new, 'XTick',[]);
set(new, 'YTick',[]);
set(new, 'Xlim',[0 1]);
set(new, 'Ylim',[0 1]);
set(new,'Visible','off');

%% Make figure bigger for export
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperSize',[8.7 8.7]*scaling);
set(gcf,'PaperPosition',[0 0.1 8.7*scaling 8.7*scaling]);
set(gcf,'PaperPositionMode', 'manual');

%% Add a global legend on bottom
hl=legend([h1,h2],{'H_{DC} when non heritable switch','H_{DC} when heritable switch'},'FontSize',fs2,'Orientation','horizontal','Box','off');
pl=get(hl,'Position');
pl(1)=0.03;
pl(2)=-0.02;
pl(3)=1;
set(hl,'Position',pl)

uistack(new,'bottom');

end