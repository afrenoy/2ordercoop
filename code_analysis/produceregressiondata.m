%% Produce the data (needs a few hours)
listem=[1 2 5 10 20 50 100 200];
listec=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
values=cell(numel(listem),numel(listec));

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


