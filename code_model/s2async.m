function [secretion_nb,mutators_dc_nb,mutators_cd_nb,neutral_nb] = s2async(seed,ngen,sizex,sizey,mutdc0,mutcd0,mutdc1,mutcd1,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,sterile,recordpath,record,graphics)
%S2ASYNC Asynchronous simulations of the model

rng(seed) % Initialize the random seed

%% Initialize the grid

secretion=zeros(sizex,sizey);
fitness=zeros(sizex,sizey);
mutdc=zeros(sizex,sizey);
mutcd=zeros(sizex,sizey);
neutral=zeros(sizex,sizey);
nnsec=zeros(sizex,sizey);

for x = 1:sizex
  for y = 1:sizey
    secretion(x,y)=floor(rand(1)*2);
    if sterile % No pure cooperators at the begining if they are sterile
        secretion(x,y)=0;
    end
    if (floor(rand(1)*2)==0)
      mutdc(x,y)=mutdc0;
    else
      mutdc(x,y)=mutdc1;
    end
    if (floor(rand(1)*2)==0)
      mutcd(x,y)=mutcd0;
    else
      mutcd(x,y)=mutcd1;
    end
    neutral(x,y)=floor(rand(1)*2);
  end
end

%% Initialize the recording
secretion_nb=zeros(1,ngen);
mutators_dc_nb=zeros(1,ngen);
mutators_cd_nb=zeros(1,ngen);
neutral_nb=zeros(1,ngen);

if (record~=0)
  fsave = fopen(recordpath,'w');
end

%% Initialize fitness
for x=1:sizex
    for y=1:sizey
      %% Compute the number of neighbours that secrete
      for tx=-1:1
        nx=mod((x+tx-1),sizex)+1;
        for ty=-1:1
          ny=mod((y+ty-1),sizey)+1;
          nnsec(x,y)=nnsec(x,y)+secretion(nx,ny);
        end
      end

      %% Deduce fitness
      fitness(x,y) = power(basefitness + benefit * nnsec(x,y)/9 - cost * secretion(x,y), mexp);
      if (fitness(x,y)<0)
        fitness(x,y)=0;
      end
      if sterile && secretion(x,y)==1
          fitness(x,y)=0;
      end

    end
end

%% For each cycle
for cycle=1:ngen*sizex*sizey
  
  if mod(cycle,100*sizex*sizey)==0
    fprintf('*');
  end
  
  %% Only record every sizex*sizey steps
  if mod(cycle,sizex*sizey)==0
      g=cycle/sizex/sizey;
  
      secretion_nb(g)=numel(find(secretion));
      mutators_dc_nb(g)=numel(find(mutdc==mutdc1));
      mutators_cd_nb(g)=numel(find(mutcd==mutcd1));
      neutral_nb(g)=numel(find(neutral));

      if (record)
        fwrite(fsave,(secretion==1));
        fwrite(fsave,(mutdc==mutdc1));
        fwrite(fsave,(mutcd==mutcd1));
        fwrite(fsave,(neutral==1));
      end
  end
  
  %% Selection and reproduction

  % Pick an individual to die
  x=randi(sizex);
  y=randi(sizey);
  
  % Competition in the neighborhood of this focal individual

  localfit=zeros(9,1);
  localprob=zeros(9,1);
  index=1;

  for tx=-1:1
    nx=mod((x+tx-1),sizex)+1;
    for ty=-1:1
      ny=mod((y+ty-1),sizey)+1;
      localfit(index) = fitness(nx,ny);
      index=index+1;
    end
  end

  if sum(localfit)==0
      assert(sterile);
      fprintf('Failed at generation %d!\n',g);
      pause(5);
      error('No viable neighboor found\n');
  end

  for n=1:9
    localprob(n)=localfit(n)/sum(localfit);
  end

  % Do a selection roulette to pick the reproducing individual
  index=0;
  pickone=rand();
  while(pickone>0)
    index=index + 1;
    pickone=pickone - localprob(index);
  end

  tx=floor((index-1)/3)-1;
  ty=mod(index-1,3)-1;
  nx=mod((x+tx-1),sizex)+1;
  ny=mod((y+ty-1),sizey)+1;

  %% Copy the selected individual
  if sterile && secretion(nx,ny)==1
      fprintf('Sterile individual reproducing !\n');
      pause(5);
      error('This should not happen!\n');
  end
  old_value=secretion(x,y); % Is cooperation value increased/decreased
  secretion(x,y) = secretion(nx,ny);
  mutdc(x,y) = mutdc(nx,ny);
  mutcd(x,y) = mutcd(nx,ny);
  neutral(x,y) = neutral(nx,ny);

  %% Then perform mutations

  % Mutation on cooperation
  if (secretion(x,y)==0)
    if (rand()<mutdc(x,y))
      secretion(x,y)=1;
    end
  elseif (secretion(x,y)==1)
    if (rand()<mutcd(x,y))
      secretion(x,y)=0;
    end
  else
    error('Erreur !');
  end

  % Mutation on mutdc
  if (rand() < mut_mutcoop)
    if (mutdc(x,y) == mutdc0)
      mutdc(x,y) = mutdc1;
    elseif (mutdc(x,y) == mutdc1)
      mutdc(x,y) = mutdc0;
    else
      error('Erreur !');
    end
  end

  % Mutation on mutcd
  if (rand() < mut_mutcoop)
    if (mutcd(x,y) == mutcd0)
      mutcd(x,y) = mutcd1;
    elseif (mutcd(x,y) == mutcd1)
      mutcd(x,y) = mutcd0;
    else
      error('Erreur !');
    end
  end

  % Mutation on neutral gene
  if (rand() < mut_neutral)
    if (neutral(x,y) == 0)
      neutral(x,y) = 1;
    elseif (neutral(x,y) == 1)
      neutral(x,y) = 0;
    else
      error('Erreur !');
    end
  end
    
  %% Update the neighboors of the replaced individual
  deltasec=secretion(x,y)-old_value;
  for tx=-1:1
    nx=mod((x+tx-1),sizex)+1;
    for ty=-1:1
      ny=mod((y+ty-1),sizey)+1;
      nnsec(nx,ny)=nnsec(nx,ny)+deltasec;
      fitness(nx,ny) = power(basefitness + benefit * nnsec(nx,ny)/9 - cost * secretion(nx,ny), mexp);
      if (fitness(nx,ny)<0)
        fitness(nx,ny)=0;
      end
      if sterile && secretion(nx,ny)==1
          fitness(nx,ny)=0;
      end
    end
  end
  
end

if (record)
  fclose(fsave);
end
fprintf('\n');

