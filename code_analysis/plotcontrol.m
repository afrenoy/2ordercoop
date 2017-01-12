function [] = plotcontrol(datadir,datadirctl,datadircth)
%PLOTCONTROL produces a standard control plot from an experiment (type figure 2)

%% Global parameters
load('graphicparamsv1');
saveh=0.11;
savev=0.16;

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
        d1=[datadir '/c' num2str(c) 'mexp' num2str(m)];
        d2=[datadirctl '/c' num2str(c) 'mexp' num2str(m)];
        d3=[datadircth '/c' num2str(c) 'mexp' num2str(m)];
        left=saveh+(nc*(1-saveh-savehr)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh-savehr)/numel(listec)-hblank;
        height=(1-savev)/numel(listem)-vblank;
        subplot('Position',[left bottom width height]);
        [ax1,h1,h4,h5]=plotcontrolpanel(d1,d2,d3);
        set(ax1,'FontSize',fs1,'LineWidth',lw1,'color','none','TickLength',[0.03 0.03],'YMinorTick','off','Box','off');
        if c==min(listec)
            set(ax1,'YAxisLocation','left');
        elseif c==max(listec)
            set(ax1,'YAxisLocation','right');
        else
            set(ax1,'YColor','none');
        end
    end
end

%% Print parameter values on left and bottom
leftax=axes('Position',[0 savev saveh 1],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
bottomax=axes('Position',[saveh 0 1 savev],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');

nm=0;
for m=listem
    nm=nm+1;
    t=text(0.15,(nm*(1-savev)-1)/numel(listem)+vblank/2+((1-savev)/numel(listem)-vblank)/2-0.04,['m = ' num2str(m)],'FontSize',fs1,'FontWeight','normal','rotation',90);
    set(t,'Parent',leftax);
end

nc=0;
for c=listec
    nc=nc+1;
    t=text((nc*(1-saveh)-1)/numel(listec)+hblank/2+((1-saveh)/numel(listec)-hblank)/2-0.04,0.70,['c = ' num2str(c)],'FontSize',fs1,'FontWeight','normal');
    set(t,'Parent',bottomax);
end

%% Create axes for labels, parameter names and background shading
new=axes('Position',[0.015 0.025 1-hright 1],'Clipping','off');%,'OuterPosition',[-0.3 -0.3 1.6 1.6]);
set(new, 'color', 'none', 'XTick',[], 'YTick',[], 'Xlim',[0 1], 'Ylim',[0 1],'Visible','off');

%% Make figure bigger for export
set(gcf,'PaperUnits','centimeters','PaperSize',[8.7 8.7]*scaling,'PaperPosition',[0 0.1 8.7*scaling 8.7*scaling],'PaperPositionMode', 'manual');

%% Add a global legend on bottom
hl=legend([h1 h4 h5],{'C allele when evolving mutation rates','C allele when enforcing low mutation rate','C allele when enforcing high mutation rate'},'FontSize',fs2,'Orientation','vertical','Box','off');
pl=get(hl,'Position');
pl(1)=0.09;
pl(2)=-0.03;
pl(3)=1;
set(hl,'Position',pl)

uistack(new,'bottom');

end