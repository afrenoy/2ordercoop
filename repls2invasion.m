function [ ] = repls2invasion( basepath, nrep,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,basefitness,cost,benefit,mexp,liquid,raretype,record )
%REPLS2INVASION Perform a set of invasion experiments

if ~exist(basepath,'dir')
  mkdir(basepath);
end

rng('shuffle')
baseseed = floor(rand()*100000);

psave=sprintf('%s/%d-%d',basepath,baseseed+1,baseseed+nrep);

secretion_nb = zeros(nrep,ngen);
mutators_dc_nb = zeros(nrep,ngen);
mutators_cd_nb = zeros(nrep,ngen);

for a=1:nrep
  recordpath=sprintf('%s/%d',basepath,baseseed+a);
  [secretion_nb(a,:),mutators_dc_nb(a,:),mutators_cd_nb(a,:)]=s2(baseseed+a,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,basefitness,cost,benefit,mexp,liquid,raretype,recordpath,record,false);
end

save([psave '.mat'],'secretion_nb','mutators_dc_nb','mutators_cd_nb',...
                    'ngen','sizex','sizey','def_mutdc','def_mutcd','evo_mutdc','evo_mutcd','mut_mutcoop',...
                    'basefitness','cost','benefit','mexp','liquid','raretype');

end

