function [ ] = ouputexp( mainfile, ctlfile, cthfile )
%OUPUTEXP Summary of this function goes here
%   Detailed explanation goes here

a=load(mainfile);

if exist('ctlfile','var')
    b=load(ctlfile);
    if ~exist('cthfile','var')
        disp('if you specify ctlfile, you must also specify cthfile (and vice versa)');
    end
    c=load(cthfile);
end

%% Plot populations average values with errors bars
[h]=plotErrorBar([a.m_secretion;a.m_mutators_dc;a.m_mutators_cd],[a.se_secretion;a.se_mutators_dc;a.se_mutators_cd],[0 0 1; 0 1 0; 1 0 0; 1 1  0; 0 1 1; 1 0 1],[0.7 0.7 1; 0.7 1 0.7; 1 0.7 0.7; 1 1 0.7; 0.7 1 1; 1 0.7 1]);
ylim([0 a.sizex*a.sizey]);
xlim([0 a.ngen]);

%% Plot what secretion would have been if enforcing low/high mutation rate
l1=line(1:100:(a.ngen+1),mean(b.m_secretion(1500:2000))*ones((a.ngen/100)+1,1),'Color','black','LineStyle','none','Marker','o','LineWidth',2.0);
l2=line(1:100:(a.ngen+1),mean(c.m_secretion(1500:2000))*ones((a.ngen/100)+1,1),'Color','black','LineStyle','none','Marker','+','LineWidth',2.0);

legend([h l1 l2],{'Secretors','High mut d->c','High mut c->d', 'enforcing high mut', 'enforcing low mut'},'FontSize',13,'Location','NorthWest');


%% Output

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 15]);
set(gcf, 'PaperPositionMode', 'auto');

print('-depsc2',[psave '.eps']);
print('-dpdf',[psave '.pdf']);
hgsave([psave '.fig']);

close all;



end

