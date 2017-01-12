function [] = exptotext( filename, expsize, outputdir )
%EXPTOTEXT extract text snaphsots
%Read the full output from an S2 simulation (binary record file), and write
%a snapshot of each generation into a text file that can be used by
%movies.py to make a movie of the simulation

fa=fopen(filename);

c=zeros(expsize);
hdc=zeros(expsize);
hcd=zeros(expsize);

i=0;

while 1
    [A,count]=fread(fa,expsize);
    if feof(fa)
        break;
    end
    assert(count==expsize(1)*expsize(2));
    if mod(i,4)==0
        c=cat(3,c,A);
    elseif mod(i,4)==1
        hdc=cat(3,hdc,A);
    elseif mod(i,4)==2
        hcd=cat(3,hcd,A);
    end
    i=i+1;
end

if ~exist(outputdir,'dir')
    mkdir(outputdir)
end
for ngen=1:size(c,3)
    fsave = fopen([outputdir '/' int2str(ngen-1)],'w');
    snap=c(:,:,ngen)+(1-c(:,:,ngen)).*hdc(:,:,ngen)*2;
    for x=1:100
        for y=1:100
            fprintf(fsave,'%d %d %d\n',x-1,y-1,snap(x,y));
        end
    end
    fclose(fsave);
end

fclose(fa);

end

