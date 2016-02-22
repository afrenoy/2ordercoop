%% Global parameters
scaling=3;
fs1=6*scaling;
fs2=6*scaling;
fs3=8*scaling;
lw1=0.3*scaling; % Edges of bar graphs, axes, ...
lw2=0.6*scaling; % Error bars
colorb1=[216.6667 230.0000 246.6667]/255;
colorb2=[226.6667 255 226.6667]/255;
colorb3=[242.2222 214.4444 246.6667]/255;

%% Initialize variables
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
values=cell(numel(listem),numel(listec));

color1=[0.176 0.533 0.176]*10/9;
color2=[0.667 0.224 0.224]*10/9;

%% Produce the data (needs a few hours)
%{
nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        nc=nc+1;
        d1=['~/data/evomut/exp1/c' num2str(c) 'mexp' num2str(m)];
        mainfile=ls([d1 '/*.mat']);
        mainfile(numel(mainfile))='';
        [mm1,mm2]=regression(mainfile);
        values{nm,nc}=[mm1,mm2];
    end
end

save('~/data/evomut/exp1.mat','values');
%}

%% Draw a subplot for each parameter combination
load('~/data/evomut/exp1.mat')

n=0;

hblank=0.045; % What horizontal space to leave between two subplots
vblank=0.015; % What vertical space to leave between two subplots

saveh=0.07; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.1; % What vertical space to leave at the bottom of the figure for 'global' labels


nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        n=n+1;
        nc=nc+1;
        left=saveh+(nc*(1-saveh)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh)/numel(listec)-hblank;
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

        % P-values
        [h,p]=ttest(mm1,mm2,'tail','right');rp(nm,nc)=p;
        if p<0.0001
            text(0.45,0.9,'***','Unit','normalized','FontSize',fs1);
        end
        
        % Error bars
        col=[0 0 0];
        lw=2;
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
    t=text((nc*(1-saveh)-1)/numel(listec)+hblank/2+((1-saveh)/numel(listec)-hblank)/2-0.04,0.70,['c = ' num2str(c)],'FontSize',fs1,'FontWeight','normal');
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
% Legend
%hl=legend([h1 h4 h5],{'C allele when evolving mutation rates','C allele when enforcing low mutation rate','C allele when enforcing high mutation rate'},'FontSize',20,'Orientation','horizontal','Box','off');
%hl=legend([h1 h2 h3],{'Cooperation loci: proportion of allele C','D\rightarrow C rate loci: proportion of allele H','C\rightarrow D rate loci: proportion of allele H'},'FontSize',20,'Orientation','horizontal','Box','off');
pl=get(hl,'Position');
pl(1)=0.1;
pl(2)=-0.015;
pl(3)=0.8;
set(hl,'Position',pl)

%% Draw parameter zones
%ini=-0.004;
ini=-0.001;
%fin=1.02;
fin=1.02;

pa=patch(-0.01+saveh/2+[ini 0.125 0.125 0.25 0.25 0.375 0.375 0.25 0.25 ini ini]*(1-saveh), 0.011+savev/2+[0.25 0.25 0.375 0.375 0.5 0.5 0.75 0.75 1 1 0.25]*(1-savev),colorb1,'LineStyle','none');
pb=patch(-0.01+saveh/2+[ini 0.125 0.125 0.375 0.375 0.875 0.875 fin fin 0.25 0.25 0.375 0.375 0.25 0.25 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0.125 0.125 0.25 0.25 0.375 0.375 0.5 0.5 1 1 0.75 0.75 0.5 0.5 0.375 0.375 0.25 0.25 0.125]*(1-savev),colorb2,'LineStyle','none');
pc=patch(-0.01+saveh/2+[ini fin fin 0.875 0.875 0.375 0.375 0.125 0.125 ini ini]*(1-saveh), 0.011+savev/2+[0 0 0.5 0.5 0.375 0.375 0.25 0.25 0.125 0.125 0]*(1-savev),colorb3,'LineStyle','none');
uistack(new,'bottom');

%% Export and fix
%print('-depsc','-loose','data1assort');
print('-dpdf','-loose','data1assort');
clf;