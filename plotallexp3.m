%% Draw a subplot for each parameter combination

n=0;
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];

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
        desc=['c = ' num2str(c) ', m = ' num2str(m)];
        d1=['~/data/evomut/exp3/c' num2str(c) 'mexp' num2str(m)];
        d2=['~/data/evomut/exp3_ctl/c' num2str(c) 'mexp' num2str(m)];
        d3=['~/data/evomut/exp3_cth/c' num2str(c) 'mexp' num2str(m)];
        left=saveh+(nc*(1-saveh)-1)/numel(listec)+hblank/2;
        bottom=savev+(nm*(1-savev)-1)/numel(listem)+vblank/2;
        width=(1-saveh)/numel(listec)-hblank;
        height=(1-savev)/numel(listem)-vblank;
        %subplot(numel(listem),numel(listec),n);
        subplot('Position',[left bottom width height]);
        [ax1,ax2,h1,h2,h3,h4,h5]=plotexp(d1,d2,d3,'');
        set(ax1,'FontSize',14);
        set(ax2,'FontSize',14);
    end
end

% Legend
hl=legend([h1 h4 h5 h2 h3],{'Pure coop. (left axis)','enforcing low switching','enforcing high switching','High d->c (right axis)','High c->d (right axis)'},'FontSize',20);

%
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
pl(1)=0.87;
set(hl,'Position',pl)

%% Export and fix
print('-depsc','inter');
system('cat inter.eps |sed -E "s/^\/DO.*/\/DO \{ [5 dpi2point mul 5 dpi2point mul] 0 setdash } bdef/g" >fig3.eps');
system('rm inter.eps');
