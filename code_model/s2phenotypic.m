function [cooperation_nb,mutators_dc_nb,neutral_nb] = s2phenotypic(seed,ngen,sizex,sizey,mutdc0,mutdc1,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,recordpath,record,graphics)
%S2PHENOTYPIC Variant of the S2 model where change toward cooperative
%phenotype happens by a phenotypic switch (and not a mutation)
% Cooperative state is thus not heritable

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

cooperation=zeros(sizex,sizey);
fitness=zeros(sizex,sizey);
mutdc=zeros(sizex,sizey);
neutral=zeros(sizex,sizey);

for x = 1:sizex
  for y = 1:sizey
    cooperation(x,y)=floor(rand(1)*2);
    if (floor(rand(1)*2)==0)
      mutdc(x,y)=mutdc0;
    else
      mutdc(x,y)=mutdc1;
    end
    neutral(x,y)=floor(rand(1)*2);
  end
end

%% Initialize the recording
cooperation_nb=zeros(1,ngen);
mutators_dc_nb=zeros(1,ngen);
neutral_nb=zeros(1,ngen);

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
        if (cooperation(x,y)==1)
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
          color='w';
        else
          color='g';
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
  cooperation_nb(g)=numel(find(cooperation));
  mutators_dc_nb(g)=numel(find(mutdc==mutdc1));
  neutral_nb(g)=numel(find(neutral));
  
  %% Record everything
  if (record)
    fwrite(fsave,(cooperation==1));
    fwrite(fsave,(mutdc==mutdc1));
    fwrite(fsave,(neutral==1));
  end

  %% Compute Fitness
  nncoop=zeros(sizex,sizey);
  
  for x=1:sizex
    for y=1:sizey
      
      %% Compute the number of neighbours that cooperate
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
          nncoop(x,y)=nncoop(x,y)+cooperation(nx,ny);
        end
      end
      
      %% Deduce fitness
      fitness(x,y) = power(basefitness + benefit * nncoop(x,y)/9 - cost * cooperation(x,y), mexp);
      if (fitness(x,y)<0)
        fitness(x,y)=0;
      end
      
    end
  end
  
  %% Create a new grid to store individual properties
  ncooperation=zeros(sizex,sizey);
  nmutdc=zeros(sizex,sizey);
  nneutral=zeros(sizex,sizey);
  
  %% Selection and reproduction
  
  pickone=rand(sizex,sizey);
  r1=rand(sizex,sizey);
  r2=rand(sizex,sizey);
  r4=rand(sizex,sizey);
  
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
      ncooperation(x,y) = 0; % Cooperative behaviour is not inherited
      nmutdc(x,y) = mutdc(nx,ny);
      nneutral(x,y) = neutral(nx,ny);

      %% Then perform mutations
      
      % Mutation on cooperation % Which is now stochastic expression with probability mutdc
      if (ncooperation(x,y)==0)
        if (r1(x,y)<nmutdc(x,y))
          ncooperation(x,y)=1;
        end
      else
        error('Erreur !');
      end
       
      % Mutation on mutdc
      if (r2(x,y) < mut_mutcoop)
        if (nmutdc(x,y) == mutdc0)
          nmutdc(x,y) = mutdc1;
        elseif (nmutdc(x,y) == mutdc1)
          nmutdc(x,y) = mutdc0;
        else
          error('Erreur !');
        end
      end
      
      % Mutation on neutral gene
      if (r4(x,y) < mut_neutral)
        if (nneutral(x,y) == 0)
          nneutral(x,y) = 1;
        elseif (nneutral(x,y) == 1)
          nneutral(x,y) = 0;
        else
          error('Erreur !');
        end
      end
      
    end
  end
  
  %% Update the variables
  cooperation=ncooperation;
  mutdc=nmutdc;
  neutral=nneutral;

  
end

if (record)
  fclose(fsave);
end
fprintf('\n');

