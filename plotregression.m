function [] = plotregression(datafile)
%PLOTREGRESSION produces a relatedness plot from an experiment with precomputations (type figure 3)

%% Global parameters
load('graphicparamsv1');
color1=[0.176 0.533 0.176]*10/9;
color2=[0.667 0.224 0.224]*10/9;
hblank=0.03; % What horizontal space to leave between two subplots
saveh=0.07; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.1; % What vertical space to leave at the bottom of the figure for 'global' labels


%% Draw a subplot for each parameter combination
n=0;

listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

values=cell(numel(listem),numel(listec));
load(datafile) % contains 'values'

nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        n=n+1;
        nc=nc+1;
        left=saveh+(nc*(1-saveh-savehr)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh-savehr)/numel(listec)-hblank;
        height=(1-savev)/numel(listem)-vblank;
        mm1=values{nm,nc}(:,1);
        mm2=values{nm,nc}(:,2);
        m1=mean(mm1);
        m2=mean(mm2);
        s1=std(mm1);
        s2=std(mm2);
        subplot('Position',[left bottom width height]);
        hold on;
        
        % Data bars
        %ylim([0 6])
        h1=bar(1,m1);
        set(h1,'FaceColor',color1);
        h2=bar(2,m2);
        set(h2,'FaceColor',color2);
        if max(m1,m2)<0.1
            ylim([0 0.12]);
            set(gca,'Ytick',[0 0.1]);
        else
            ylim([0 7]);
            set(gca,'Ytick',[0 6]);
        end
        set(gca,'Xtick',[]);
        xlim([0.2 2.8]);
        set(gca,'FontSize',fs1);
        set(gca,'color','none');
        set(gca,'TickLength',[0.03 0.03]);
        set(gca,'YMinorTick','off');
        set(gca,'LineWidth',lw1);
        if c==min(listec)
            set(gca,'YaxisLocation','left');
        elseif c==max(listec)
            set(gca,'YaxisLocation','right');
        else
            set(gca,'Ycolor','none');
        end

        % P-values
        [~,p]=ttest(mm1,mm2,'tail','right');
        %rp(nm,nc)=p;
        if p<0.0001
            text(0.4,0.8,'***','Unit','normalized','FontSize',fs1);
        end
        
        % Error bars
        col=[0 0 0];
        line([1 1],[m1-s1 m1+s1],'Color',col,'LineWidth',lw2);
        line([2 2],[m2-s2 m2+s2],'Color',col,'LineWidth',lw2);
        
        hold off;
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
    t=text((nc*(1-saveh-savehr)-1)/numel(listec)+hblank/2+((1-saveh-savehr)/numel(listec)-hblank)/2-0.04,0.70,['c = ' num2str(c)],'FontSize',fs1,'FontWeight','normal');
    set(t,'Parent',bottomax);
end

%% Create axes for labels and parameter names
new=axes('Position',[0.015 0.025 1 1]);
set(new, 'color', 'none');
set(new, 'XTick',[]);
set(new, 'YTick',[]);
set(new, 'Xlim',[0 1]);
set(new, 'Ylim',[0 1]);
set(new,'Visible','off');

%% Make figure bigger for export
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperSize',[8.7 8.7]*scaling);
set(gcf,'PaperPosition',[0.1 0.1 8.7*scaling 8.7*scaling]);
set(gcf,'PaperPositionMode', 'manual');


%% Add a global legend on bottom
hl=legend([h1 h2],{'Proximity of (D, *, H_{DC}) with (C, *, *)      m','Proximity of (D, *, L_{DC}) with (C, *, *)'},'FontSize',fs2,'Orientation','horizontal','Box','off');
pl=get(hl,'Position');
pl(1)=0.1;
pl(2)=-0.015;
pl(3)=0.8;
set(hl,'Position',pl)

uistack(new,'bottom');

end