function [ ] = repls2phenotypic( basepath, nrep,ngen,sizex,sizey,def_mutdc,evo_mutdc,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,record )
%REPLS2 Perform a set of experiments: call the model for several replicates
%and output graphes

if ~exist(basepath,'dir')
  mkdir(basepath);
end

rng('shuffle')
baseseed = floor(rand()*100000);

psave=sprintf('%s/%d-%d',basepath,baseseed+1,baseseed+nrep);

secretion_nb = zeros(nrep,ngen);
mutators_dc_nb = zeros(nrep,ngen);
neutral_nb = zeros(nrep,ngen);

for a=1:nrep
  recordpath=sprintf('%s/%d',basepath,baseseed+a);
  [secretion_nb(a,:),mutators_dc_nb(a,:),neutral_nb(a,:)]=s2(baseseed+a,ngen,sizex,sizey,def_mutdc,evo_mutdc,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,recordpath,record,false);
end

m_secretion=mean(secretion_nb,1);
m_mutators_dc=mean(mutators_dc_nb,1);
m_neutral=mean(neutral_nb,1);

s_secretion=std(secretion_nb,0,1);
s_mutators_dc=std(mutators_dc_nb,0,1);
s_neutral=std(neutral_nb,0,1);

se_secretion=s_secretion/sqrt(nrep);
se_mutators_dc=s_mutators_dc/sqrt(nrep);
se_neutral=s_neutral/sqrt(nrep);

save([psave '.mat'],'secretion_nb','mutators_dc_nb','neutral_nb',...
                    'm_secretion','m_mutators_dc','m_neutral',...
                    'se_secretion','se_mutators_dc','se_neutral',...
                    'ngen','sizex','sizey','def_mutdc','evo_mutdc','mut_mutcoop','mut_neutral',...
                    'basefitness','cost','benefit','mexp','liquid');

[h]=plotErrorBar([m_secretion;m_mutators_dc;m_neutral],[se_secretion;se_mutators_dc;se_neutral]);
ylim([0 sizex*sizey]);

legend(h,{'Secretors','High mut d->c','Neutral gene'},'FontSize',13,'Location','NorthWest');

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 15]);
set(gcf, 'PaperPositionMode', 'auto');

print('-depsc2',[psave '.eps']);
print('-dpdf',[psave '.pdf']);
hgsave([psave '.fig']);

close all;

end

