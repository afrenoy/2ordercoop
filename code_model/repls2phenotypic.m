function [ ] = repls2phenotypic( basepath, nrep,ngen,sizex,sizey,def_mutdc,evo_mutdc,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,record )
%REPLS2PHENOTYPIC Perform a set of S2-phenotypic experiments

producegraphics=false;

if ~exist(basepath,'dir')
  mkdir(basepath);
end

rng('shuffle')
baseseed = floor(rand()*100000);

psave=sprintf('%s/%d-%d',basepath,baseseed+1,baseseed+nrep);

cooperation_nb = zeros(nrep,ngen);
mutators_dc_nb = zeros(nrep,ngen);
neutral_nb = zeros(nrep,ngen);

for a=1:nrep
  recordpath=sprintf('%s/%d',basepath,baseseed+a);
  [cooperation_nb(a,:),mutators_dc_nb(a,:),neutral_nb(a,:)]=s2phenotypic(baseseed+a,ngen,sizex,sizey,def_mutdc,evo_mutdc,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,recordpath,record,false);
end

m_cooperation=mean(cooperation_nb,1);
m_mutators_dc=mean(mutators_dc_nb,1);
m_neutral=mean(neutral_nb,1);

s_cooperation=std(cooperation_nb,0,1);
s_mutators_dc=std(mutators_dc_nb,0,1);
s_neutral=std(neutral_nb,0,1);

se_cooperation=s_cooperation/sqrt(nrep);
se_mutators_dc=s_mutators_dc/sqrt(nrep);
se_neutral=s_neutral/sqrt(nrep);

save([psave '.mat'],'cooperation_nb','mutators_dc_nb','neutral_nb',...
                    'm_cooperation','m_mutators_dc','m_neutral',...
                    'se_cooperation','se_mutators_dc','se_neutral',...
                    'ngen','sizex','sizey','def_mutdc','evo_mutdc','mut_mutcoop','mut_neutral',...
                    'basefitness','cost','benefit','mexp','liquid');

if producegraphics
    [h]=plotErrorBar([m_cooperation;m_mutators_dc;m_neutral],[se_cooperation;se_mutators_dc;se_neutral]);
    ylim([0 sizex*sizey]);

    legend(h,{'Cooperators','High mut d->c','Neutral gene'},'FontSize',13,'Location','NorthWest');

    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [20 15]);
    set(gcf, 'PaperPositionMode', 'auto');

    print('-depsc2',[psave '.eps']);
    print('-dpdf',[psave '.pdf']);
    hgsave([psave '.fig']);

    close all;
end

end

