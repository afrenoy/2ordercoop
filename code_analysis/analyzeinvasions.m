%ANALYZEINVASIONS produces figures invasion1a-3b.pdf

% Second measure: Biggest number of offsprings of the invader (among all generations)
ylab='Invasion success';

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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
hl=line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.2,'***','FontSize',20,'HorizontalAlignment','center');
text(2,max(mean(c),mean(d))/400*1.2,'***','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
legend([hb hl],{'rare L_{DC}','rare H_{DC}','Genetic drift'},'Location','NorthWest','Box','off');
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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.2,'**','FontSize',20,'HorizontalAlignment','center');
%text(2,max(mean(c),mean(d))/400*1.2,'ns','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.1,'***','FontSize',20,'HorizontalAlignment','center');
text(2,max(mean(c),mean(d))/400*1.1,'***','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.2,'*','FontSize',20,'HorizontalAlignment','center');
%text(2,max(mean(c),mean(d))/400*1.2,'ns','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.1,'***','FontSize',20,'HorizontalAlignment','center');
text(2,max(mean(c),mean(d))/400*1.1,'***','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0]);
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
sea=std(a)/sqrt(numel(a));
seb=std(b)/sqrt(numel(b));
sec=std(c)/sqrt(numel(c));
sed=std(d)/sqrt(numel(d));
line([0.865 0.865],[mean(a)/400-sea/400 mean(a)/400+sea/400],'LineWidth',2.5,'color','k');
line([1.135 1.135],[mean(b)/400-seb/400 mean(b)/400+seb/400],'LineWidth',2.5,'color','k');
line([1.865 1.865],[mean(c)/400-sec/400 mean(c)/400+sec/400],'LineWidth',2.5,'color','k');
line([2.135 2.135],[mean(d)/400-sed/400 mean(d)/400+sed/400],'LineWidth',2.5,'color','k');
line([0.5 2.5],[mean(alldrift) mean(alldrift)]/400,'LineWidth',2,'Color','k');

% Stats
[h1,p1]=ttest2(a,b,'Vartype','unequal');
[h2,p2]=ttest2(c,d,'Vartype','unequal');
text(1,max(mean(a),mean(b))/400*1.2,'*','FontSize',20,'HorizontalAlignment','center');
text(2,max(mean(c),mean(d))/400*1.1,'***','FontSize',20,'HorizontalAlignment','center');

set(gca,'XTickLabel',{'structured','mixed'},'FontSize',20,'TickLength',[0 0],'YAxisLocation','right','YTick',[]);
%ylabel(ylab);
title('H=0.5   c=0.9   m=100');
colormap(gca,lines(5));
ylim([0 0.6]);
print('-dpdf','-loose','invasion3b');
close();


