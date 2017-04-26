Code and Data for Frénoy et al 2017, submited to Evolution

# code_model: Matlab implementation of our model
- s2.m is the main file, it is a Matlab function which runs one replicate of evolution using a given random seed. Provides 2 kinds of output: allele frequencies at each time point (as a returned value) and optionally full spatial snapshot of the population at each time point (written in specified binary file)
- repls2.m runs several replicates of evolution, calling s2 several times, and saves the average output (allele frequency, with standard deviation) into a .mat file
- s2phenotypic.m is a variant of the model in which pure cooperation is a phenotypic switch (while in s2.m it is a genetic switch). repls2phenotypic.m runs several replicates of evolution for this alternative model
- s2invasion.m is a variant of the model in which we measure how much an initially rare allele can invades a population not containing this allele, repls2invasion runs several replicates simulations of invasion
- s2async.m is a  variant of the model in which simulations are asynchronous: a time step corresponds to the random death of an individual, and competition in the neighborhood for reproduction and replacement of the dying individual

# data: Contains all the simulation data
Each subfolder corresponds to a set of simulations. The correspondence between the figures and the simulations is given below:

| data subfolder | figures | description |
| -------------------- | --------------- | --------------------------------------------------------------- |
| exp1 | fig 1,2,3,S3 | Main simulation: evolution of cooperation with evolvable mutation rate, high mutation rate is 0.01 |
| exp1_ctl | fig 2 | exp1 when enforcing a low mutation rate |
| exp1_cth | fig 2 | exp1 when enforcing a high mutation rate |
| exp1_sterile | fig S6 | exp1 when pure cooperators are sterile |
| exp1_phenotypic | fig S3 | exp1 when cooperative behavior is controled by a non-heritable switch |
| exp1_liquid | fig S1 | exp1 when neighborhood are randomized |
| exp1_async | fig S7 | exp1 when the modeled is simulated asynchronously |
| exp2 | fig S4 | Similar to exp1, but high mutation rate is 0.1 |
| exp3 | fig S5 | Similar to exp1, but high mutation rate is 0.5 |
| invasion | fig S2 | Simulations of invasion of a clonal population by a rare mutant allele |


# code_analysis: Matlab functions to produce all figures in the paper from the simulation data
These functions are commented, and all the input parameters needed to produce exactly all the figures presented in the paper (including supplementary material) from the content of the `data` directory are provided in a Makefile. Runing `make all` will produce all the figures using the content of the `data` directory.

# code_runs: Bash scripts used to run the simulations (on a computing cluster) producing all the data presented in this work
These scripts rely on a function `matlabcmd` (defined in `common.sh`) that runs the matlab command given as argument. Such command depends on the computer platform used. We give 2 examples:

- `launchmatlabcommandrnd.sh`, a script that submits the matlab command as a job on a Grid Engine computing platform (such as the CC-IN2P3 platform that we used for this study)
- `launchmatlablocal.sh`, a script that directly runs the command using a local version of Matlab and should be modified according to the Matlab installation

To locally rerun our simulations and produce a new version of any subdirectory in the `data` directory, one should:

- Remove the content of this subdirectory (eg `rm -f data/exp1/*`)
- Edit `launchmatlablocal.sh` to match the Matlab installation
- Run the script matching the data subdirectory (eg `cd code_runs && ./exp1.sh`)

