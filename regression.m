function [m1,m2] = regression( matfile )
%REPLS2 Computes an analog of relatedness

sim=load(matfile);
[pathstr,name,ext] = fileparts(matfile);
assert(strcmp(ext,'.mat'));

C=textscan(name,'%d-%d');
first=C{1};
last=C{2};
nrep=last-first+1;

m1=zeros(nrep,1);
m2=zeros(nrep,1);
irep=0;

for rep=first:last
    irep=irep+1;
    source=[pathstr '/' int2str(rep)];
    f=fopen(source);
    
    nagen=sim.ngen-1000+1;
    for i=1000:sim.ngen % we avoid the first 1000 generations (before 'equilibrium')
        if mod(i,100)==0
            fprintf('*');
        end

        %% Read
        secretion=fread(f,[sim.sizex,sim.sizey]);
        mutdc=fread(f,[sim.sizex,sim.sizey]);
        fread(f,[sim.sizex,sim.sizey]);
        fread(f,[sim.sizex,sim.sizey]);
        
        hascoopn=zeros(sim.sizex,sim.sizey);
        [a,b]=find(secretion);
        
        % fill matrix hascoopn
        for index=1:length(a)
            x=a(index);
            y=b(index);
            for tx=-1:1
                nx=mod((x+tx-1),sim.sizex)+1;
                for ty=-1:1
                    ny=mod((y+ty-1),sim.sizey)+1;
                    hascoopn(nx,ny)=hascoopn(nx,ny)+1;
                end
            end
        end

        % Count the proportion of second-order cooperators having pure
        % cooperators in the neighboorood, compare with non-cooperators
        soc=find(secretion==0&mutdc==1);
        sod=find(secretion==0&mutdc==0);
        
        p1=sum(hascoopn(soc))/numel(soc);
        p2=sum(hascoopn(sod))/numel(sod);
        m1(irep)=m1(irep)+p1;
        m2(irep)=m2(irep)+p2;
    end
    m1(irep)=m1(irep)/nagen;
    m2(irep)=m2(irep)/nagen;
    fclose(f);
end



end

