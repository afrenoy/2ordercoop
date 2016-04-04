% Second measure: Biggest number of offsprings of the invader (among all generations)
ylab='Invasion';

%% Exp1 m=1

% Data
e=load('~/data/evomut/invasion/exp1invasion_0/c0.9mexp1/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasion_1/c0.9mexp1/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_0/c0.9mexp1/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_1/c0.9mexp1/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp1invasion_0_neutral/c0.9mexp1/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasion_1_neutral/c0.9mexp1/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_0_neutral/c0.9mexp1/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_1_neutral/c0.9mexp1/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
hb=bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
hl=line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
legend([hb hl],{'invasion by L_{DC}','invasion by H_{DC}','Genetic drift'},'Location','NorthWest','Box','off');
ylabel(ylab);
title('H=0.01   c=0.9   m=1');
colormap(gca,lines(5));
ylim([0 0.06]);
print('-dpdf','-loose','invasion1a');
close();


%% Exp1 m=100

% Data
e=load('~/data/evomut/invasion/exp1invasion_0/c0.9mexp100/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasion_1/c0.9mexp100/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_0/c0.9mexp100/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_1/c0.9mexp100/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp1invasion_0_neutral/c0.9mexp100/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasion_1_neutral/c0.9mexp100/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_0_neutral/c0.9mexp100/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp1invasionl_1_neutral/c0.9mexp100/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
%legend({'invasion of L_{DC}','invasion of H_{DC}'},'Location','North');
%ylabel(ylab);
title('H=0.01   c=0.9   m=100');
colormap(gca,lines(5));
ylim([0 0.06]);
print('-dpdf','-loose','invasion1b');
close();


%% Exp2 m=1

% Data
e=load('~/data/evomut/invasion/exp2invasion_0/c0.9mexp1/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasion_1/c0.9mexp1/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_0/c0.9mexp1/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_1/c0.9mexp1/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp2invasion_0_neutral/c0.9mexp1/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasion_1_neutral/c0.9mexp1/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_0_neutral/c0.9mexp1/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_1_neutral/c0.9mexp1/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
%legend({'invasion of L_{DC}','invasion of H_{DC}'},'Location','North');
ylabel(ylab);
title('H=0.1   c=0.9   m=1');
colormap(gca,lines(5));
ylim([0 0.25]);
print('-dpdf','-loose','invasion2a');
close();


%% Exp2 m=100

% Data
e=load('~/data/evomut/invasion/exp2invasion_0/c0.9mexp100/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasion_1/c0.9mexp100/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_0/c0.9mexp100/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_1/c0.9mexp100/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp2invasion_0_neutral/c0.9mexp100/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasion_1_neutral/c0.9mexp100/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_0_neutral/c0.9mexp100/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp2invasionl_1_neutral/c0.9mexp100/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
%legend({'invasion of L_{DC}','invasion of H_{DC}'},'Location','North');
%ylabel(ylab);
title('H=0.1   c=0.9   m=100');
colormap(gca,lines(5));
ylim([0 0.25]);
print('-dpdf','-loose','invasion2b');
close();



%% Exp3 m=1

% Data
e=load('~/data/evomut/invasion/exp3invasion_0/c0.9mexp1/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasion_1/c0.9mexp1/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_0/c0.9mexp1/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_1/c0.9mexp1/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp3invasion_0_neutral/c0.9mexp1/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasion_1_neutral/c0.9mexp1/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_0_neutral/c0.9mexp1/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_1_neutral/c0.9mexp1/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
%legend({'invasion of L_{DC}','invasion of H_{DC}'},'Location','North');
ylabel(ylab);
title('H=0.5   c=0.9   m=1');
colormap(gca,lines(5));
ylim([0 0.6]);
print('-dpdf','-loose','invasion3a');
close();


%% Exp3 m=100

% Data
e=load('~/data/evomut/invasion/exp3invasion_0/c0.9mexp100/res.mat'); a=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasion_1/c0.9mexp100/res.mat'); b=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_0/c0.9mexp100/res.mat'); c=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_1/c0.9mexp100/res.mat'); d=max(e.mutators_dc_nb,[],2);

% Neutral control
e=load('~/data/evomut/invasion/exp3invasion_0_neutral/c0.9mexp100/res.mat'); adrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasion_1_neutral/c0.9mexp100/res.mat'); bdrift=max(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_0_neutral/c0.9mexp100/res.mat'); cdrift=400-min(e.mutators_dc_nb,[],2);
e=load('~/data/evomut/invasion/exp3invasionl_1_neutral/c0.9mexp100/res.mat'); ddrift=max(e.mutators_dc_nb,[],2);
alldrift=[adrift;bdrift;cdrift;ddrift];
pc=prctile([adrift;bdrift;cdrift;ddrift],[5 95]);

% Graph
figure();
bar([mean(a) mean(b); mean(c) mean(d)]/400);
patch([0.5 0.5 2.5 2.5],[pc(1) pc(2) pc(2) pc(1)]/400,[0.1 0.1 0.1],'FaceAlpha',0.3,'LineStyle','none');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');
line([0.5 2.5],[pc(1) pc(1)]/400,'LineWidth',2,'Color','k','LineStyle','--');
line([0.5 2.5],[pc(2) pc(2)]/400,'LineWidth',2,'Color','k','LineStyle','--');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
%legend({'invasion of L_{DC}','invasion of H_{DC}'},'Location','North');
%ylabel(ylab);
title('H=0.5   c=0.9   m=100');
colormap(gca,lines(5));
ylim([0 0.6]);
print('-dpdf','-loose','invasion3b');
close();


