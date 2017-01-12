function [secretion_nb,mutators_dc_nb,mutators_cd_nb] = s2invasion(seed,ngen,sizex,sizey,mutdc0,mutcd0,mutdc1,mutcd1,basefitness,cost,benefit,mexp,liquid,raretype,recordpath,record,graphics)
%S2INVASION We test whether a rare individual of any type can invade other
%types in S2 without mutations

%% Initialize the random seed
if exist('seed','var')
  rng(seed)
else
  rng('shuffle');
end

%% Intitialize parameters
if ~exist('liquid','var')
  liquid=false;
end

%% Graphic properties
if ~exist('graphics','var')
  graphics=false;
end

sq = 1;

%% Initialize the grid

secretion=zeros(sizex,sizey);
fitness=zeros(sizex,sizey);
mutdc=zeros(sizex,sizey);
mutcd=zeros(sizex,sizey);

for x = 1:sizex
  for y = 1:sizey
    secretion(x,y)=0; % D at C/D locus
    if (floor(rand(1)*2)==0) % Random choice at LCD/HCD locus
      mutcd(x,y)=mutcd0;
    else
      mutcd(x,y)=mutcd1;
    end
    mutdc(x,y)=(1-raretype)*mutdc1+raretype*mutdc0; % raretype is 1 for HDC mutator, 0 for LDC
  end
end

xrare=floor(sizex/2);
yrare=floor(sizey/2);
mutdc(xrare,yrare)=raretype*mutdc1+(1-raretype)*mutdc0; % The rare indiviual at the middle of the grid

%% Initialize the recording
secretion_nb=zeros(1,ngen);
mutators_dc_nb=zeros(1,ngen);
mutators_cd_nb=zeros(1,ngen);

if (record~=0)
  fsave = fopen(recordpath,'w');
end

%% For each generation
for g=1:ngen
  
  %% Plot the current grid
  if (graphics==1)
    clf('reset');
    
    subplot(1,2,1);
    hold on;
    for x=1:sizex
      for y=1:sizey
        if (secretion(x,y)==1)
          color='b';
        else
          color='w';
        end
        fill([x x+sq x+sq x],[y y y+sq y+sq],color);     
      end
    end
    
    subplot(1,2,2);
    hold on;
    for x=1:sizex
      for y=1:sizey
        if (mutdc(x,y)==mutdc0)
          if (mutcd(x,y)==mutcd0)
            color='w';
          elseif (mutcd(x,y)==mutcd1)
            color='r';
          else
            error('Erreur !');
          end
        else
          if (mutcd(x,y)==mutcd0)
            color='g';
          elseif (mutcd(x,y)==mutcd1)
            color='b';
          else
            error('Erreur !');
          end
        end
        fill([x x+sq x+sq x],[y y y+sq y+sq],color);     
      end
    end
    
    pause(0.01);
  end
  
  if mod(g,100)==0
    fprintf('*');
  end
  
  %% Record the average properties
  secretion_nb(g)=numel(find(secretion));
  mutators_dc_nb(g)=numel(find(mutdc==mutdc1));
  mutators_cd_nb(g)=numel(find(mutcd==mutcd1));
  
  %% Record everything
  if (record)
    fwrite(fsave,(secretion==1));
    fwrite(fsave,(mutdc==mutdc1));
    fwrite(fsave,(mutcd==mutcd1));
  end

  %% Compute Fitness
  nnsec=zeros(sizex,sizey);
  
  for x=1:sizex
    for y=1:sizey
      
      %% Compute the number of neighbours that secrete
      for tx=-1:1
        nx=mod((x+tx-1),sizex)+1;
        if liquid % If option liquid is activated we randomly pick the neighboors
            nx=randi(sizex);
        end
        for ty=-1:1
          ny=mod((y+ty-1),sizey)+1;
          if liquid
              ny=randi(sizey);
          end
          nnsec(x,y)=nnsec(x,y)+secretion(nx,ny);
        end
      end
      
      %% Deduce fitness
      fitness(x,y) = power(basefitness + benefit * nnsec(x,y)/9 - cost * secretion(x,y), mexp);
      if (fitness(x,y)<0)
        fitness(x,y)=0;
      end
      
    end
  end
  
  %% Create a new grid to store individual properties
  nsecretion=zeros(sizex,sizey);
  nmutdc=zeros(sizex,sizey);
  nmutcd=zeros(sizex,sizey);
  
  %% Selection and reproduction
  
  pickone=rand(sizex,sizey);
  r1=rand(sizex,sizey);
  
  for x=1:sizex
    for y=1:sizey
      %% Select an individual
      
      localfit=zeros(9,1);
      localprob=zeros(9,1);
      index=1;
      
      % Create the local fitness vector
      for tx=-1:1
        nx=mod((x+tx-1),sizex)+1;
        for ty=-1:1
          ny=mod((y+ty-1),sizey)+1;
          localfit(index) = fitness(nx,ny);
          index=index+1;
        end
      end
      
      % Compute the probability of reproduction of each individual
      for n=1:9
        localprob(n)=localfit(n)/sum(localfit);
      end
      
      % Do a selection roulette to pick the reproducing individual
      index=0;
      while(pickone(x,y)>0);
        index=index + 1;
        pickone(x,y)=pickone(x,y) - localprob(index);
      end
      
      tx=floor((index-1)/3)-1;
      ty=mod(index-1,3)-1;
      nx=mod((x+tx-1),sizex)+1;
      ny=mod((y+ty-1),sizey)+1;
      
      %% Copy the selected individual
      nsecretion(x,y) = secretion(nx,ny);
      nmutdc(x,y) = mutdc(nx,ny);
      nmutcd(x,y) = mutcd(nx,ny);

      %% Then perform mutations
      
      % Mutation on cooperation only
      if (nsecretion(x,y)==0)
        if (r1(x,y)<nmutdc(x,y))
          nsecretion(x,y)=1;
        end
      elseif (nsecretion(x,y)==1)
        if (r1(x,y)<nmutcd(x,y))
          nsecretion(x,y)=0;
        end
      else
        error('Erreur !');
      end
       
      
    end
  end
  
  %% Update the variables
  secretion=nsecretion;
  mutdc=nmutdc;
  mutcd=nmutcd;

  
end

if (record)
  fclose(fsave);
end
fprintf('\n');

