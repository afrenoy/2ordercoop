n=0;
listem=[1 2 5 10 20 50];
listec=[0.3 0.4 0.5 0.6 0.7 0.8];

for m=listem
    for c=listec
        n=n+1;
        desc=['c = ' num2str(c) ', m = ' num2str(m)];
        d1=['~/data/evomut/exp1/c' num2str(c) 'mexp' num2str(m)];
        d2=['~/data/evomut/exp1_ctl/c' num2str(c) 'mexp' num2str(m)];
        d3=['~/data/evomut/exp1_cth/c' num2str(c) 'mexp' num2str(m)];
        subplot(numel(listem),numel(listec),n);
        plotexp(d1,d2,d3);  
    end
end

%%
subplot(3,3,1);
plotexp( '~/data/evomut/exp1/c0.3mexp1','~/data/evomut/exp1_ctl/c0.3mexp1','~/data/evomut/exp1_cth/c0.3mexp1' )