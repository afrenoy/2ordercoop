Code and Data for Frénoy et al 2017, submited to Evolution

#code_model: Matlab implementation of our model
- s2.m is the main file, it is a Matlab function which runs one replicate of evolution using a given random seed. Provides 2 kinds of output: allele frequencies at each time point (as a returned value) and optionally full spatial snapshot of the population at each time point (written in specified binary file)
- repls2.m runs several replicates of evolution, calling s2 several times, and saves the average output (allele frequency, with standard deviation) into a .mat file
- s2phenotypic.m is a variant of the model in which pure cooperation is a phenotypic switch (while in s2.m it is a genetic switch). repls2phenotypic.m runs several replicates of evolution for this alternative model
- s2invasion.m is a variant of the model in which we measure how much an initially rare allele can invades a population not containing this allele, repls2invasion runs several replicates simulations of invasion

#code_runs: Bash scripts used to run the simulations (on a computing cluster) producing all the data presented in this work

#code_analysis: Matlab functions to produce all figures in the paper from the simulation data
These functions are well commented, and all the input parameters needed to produce exactly all the figures presented in the paper (including supplementary material) are provided in a Makefile. Runing ``make all'' will produce all the figures using the content of the ``data'' directory.

#data: Contains all the simulation data
The aforementioned Makefile allows to easily understand which subfolder corresponds to which figure.

