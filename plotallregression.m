%% initialize variables
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
values=cell(numel(listem),numel(listec));

%% Produce the data (needs a few hours)

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


%% Draw a subplot for each parameter combination
load('~/data/evomut/exp1.mat')

n=0;

hblank=0.03; % What horizontal space to leave between two subplots
vblank=0.015; % What vertical space to leave between two subplots

saveh=0.02; % What horizontal space to leave at the left of the figure for 'global' labels
savev=0.03; % What vertical space to leave at the bottom of the figure for 'global' labels


nm=0;
for m=listem
    nc=0;
    nm=nm+1;
    for c=listec
        n=n+1;
        nc=nc+1;
        %desc=['c = ' num2str(c) ', m = ' num2str(m)];
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
        
        %ndata=numel(mm1);
        %scatter(ones(ndata,1),mm1,40,[0.2 0.8 0.4],'fill');
        %scatter(ones(ndata,1)*2,mm2,40,[1 0 0],'fill');
        
        %ylim([0 6])
        h1=bar(1,m1);
        set(h1,'FaceColor',[0.2 0.8 0.4]);
        set(h1,'BaseValue',0.01);
        h2=bar(2,m2,'r');
        set(h2,'FaceColor',[1 0 0]);
        set(h2,'BaseValue',0.01);
        set(gca,'Yscale','log');
        ylim([0.01 7]);
        set(gca,'Xtick',[]);
        xlim([0 3]);
        
        [h,p]=ttest2(mm1,mm2,'tail','right');
        if p<0.0001
            text(0.45,0.9,'***','Unit','normalized','FontSize',25);
        elseif p<0.001
            text(0.45,0.9,'**','Unit','normalized','FontSize',25);
        elseif p<0.01
            text(0.48,0.9,'*','Unit','normalized','FontSize',25);
        end
        
        hold off;
        %set(ax1,'FontSize',14);
        %set(ax2,'FontSize',14);
    end
end

% Legend
hl=legend({'Second order cooperators','Non cooperators'},'FontSize',20);


leftax=subplot('Position',[0 savev saveh 1],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');
bottomax=subplot('Position',[saveh 0 1 savev],'color','none','Xtick',[],'Ytick',[],'Box','off','visible','off');

nm=0;
for m=listem
    nm=nm+1;
    t=text(0.3,(nm*(1-savev)-1)/numel(listem)+vblank/2+((1-savev)/numel(listem)-vblank)/2-0.02,['m = ' num2str(m)],'FontSize',18,'FontWeight','bold','rotation',90);
    set(t,'Parent',leftax);
end

nc=0;
for c=listec
    nc=nc+1;
    t=text((nc*(1-saveh)-1)/numel(listec)+hblank/2+((1-saveh)/numel(listec)-hblank)/2-0.01,0.6,['c = ' num2str(c)],'FontSize',18,'FontWeight','bold');
    set(t,'Parent',bottomax);
end

%% Prepare for export
set(gcf,'units','normalized','outerposition',[0 0 0.8 1]);
set(gcf, 'PaperPositionMode', 'auto');
pl=get(hl,'Position');
pl(1)=0.86;
pl(2)=0.93;
set(hl,'Position',pl)

%% Export and fix
print('-depsc','inter');
system('cat inter.eps |sed -E "s/^\/DO.*/\/DO \{ [5 dpi2point mul 5 dpi2point mul] 0 setdash } bdef/g" >fig2.eps');
system('rm inter.eps');
