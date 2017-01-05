function [nbcoop,nb2coop,nb2d,stdcoop,std2coop,std2d,nbctl,stdctl,nbcth,stdcth,m1,m2,s1,s2] = computefromexp( mainfile, varargin)
%COMPUTEFROMEXP compute measures of interest from simulation mat file +
%controls

a=load(mainfile);
v1=mean(a.secretion_nb(:,1500:2000),2);
nbcoop=mean(v1);
stdcoop=std(v1);
v2=mean(a.mutators_dc_nb(:,1500:2000),2);
nb2coop=mean(v2);
std2coop=std(v2);
v5=mean(a.mutators_cd_nb(:,1500:2000),2);
nb2d=mean(v5);
std2d=std(v5);

if length(varargin)==2
    ctlfile=varargin{1};
    cthfile =varargin{2};

    b=load(ctlfile);
    v3=mean(b.secretion_nb(:,1500:2000),2);
    nbctl=mean(v3);
    stdctl=std(v3);

    c=load(cthfile);
    v4=mean(c.secretion_nb(:,1500:2000),2);
    nbcth=mean(v4);
    stdcth=std(v4);
else
    nbctl=nan;
    stdctl=nan;
    nbcth=nan;
    stdcth=nan;
end

%[mm1,mm2]=regression(mainfile);
%m1=mean(mm1);
%m2=mean(mm2);
%s1=std(mm1);
%s2=std(mm2);
m1=0;
s1=0;
m2=0;
s2=0;

end

