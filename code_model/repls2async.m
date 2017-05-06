function [ ] = repls2async( basepath, nrep,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,sterile,record )
%REPLS2ASYNC Perform a set of async experiments

producegraphics=false;

if ~exist(basepath,'dir')
  mkdir(basepath);
end

rng('shuffle')
baseseed = floor(rand()*100000);

psave=sprintf('%s/%d-%d',basepath,baseseed+1,baseseed+nrep);

cooperation_nb = zeros(nrep,ngen);
mutators_dc_nb = zeros(nrep,ngen);
mutators_cd_nb = zeros(nrep,ngen);
neutral_nb = zeros(nrep,ngen);

for a=1:nrep
  recordpath=sprintf('%s/%d',basepath,baseseed+a);
  [cooperation_nb(a,:),mutators_dc_nb(a,:),mutators_cd_nb(a,:),neutral_nb(a,:)]=s2async(baseseed+a,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,sterile,recordpath,record,false);
end

m_cooperation=mean(cooperation_nb,1);
m_mutators_dc=mean(mutators_dc_nb,1);
m_mutators_cd=mean(mutators_cd_nb,1);
m_neutral=mean(neutral_nb,1);

s_cooperation=std(cooperation_nb,0,1);
s_mutators_dc=std(mutators_dc_nb,0,1);
s_mutators_cd=std(mutators_cd_nb,0,1);
s_neutral=std(neutral_nb,0,1);

se_cooperation=s_cooperation/sqrt(nrep);
se_mutators_dc=s_mutators_dc/sqrt(nrep);
se_mutators_cd=s_mutators_cd/sqrt(nrep);
se_neutral=s_neutral/sqrt(nrep);

save([psave '.mat'],'cooperation_nb','mutators_dc_nb','mutators_cd_nb','neutral_nb',...
                    'm_cooperation','m_mutators_dc','m_mutators_cd','m_neutral',...
                    'se_cooperation','se_mutators_dc','se_mutators_cd','se_neutral',...
                    'ngen','sizex','sizey','def_mutdc','def_mutcd','evo_mutdc','evo_mutcd','mut_mutcoop','mut_neutral',...
                    'basefitness','cost','benefit','mexp','liquid','sterile');

if producegraphics
    [h]=plotErrorBar([m_cooperation;m_mutators_dc;m_mutators_cd;m_neutral],[se_cooperation;se_mutators_dc;se_mutators_cd;se_neutral]);
    ylim([0 sizex*sizey]);

    legend(h,{'Cooperators','High mut d->c','High mut c->d','Neutral gene'},'FontSize',13,'Location','NorthWest');

    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperSize', [20 15]);
    set(gcf, 'PaperPositionMode', 'auto');

    print('-depsc2',[psave '.eps']);
    print('-dpdf',[psave '.pdf']);
    hgsave([psave '.fig']);

    close all;
end

end

