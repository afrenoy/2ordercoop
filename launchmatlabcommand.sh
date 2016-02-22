#!/bin/bash

# Create the script
touch ~/matlab/temp_${2}.m
echo "path(path,'/afs/in2p3.fr/home/a/afrenoy/matlab');" >> ~/matlab/temp_${2}.m
echo ${1} >> ~/matlab/temp_${2}.m
echo "exit;" >> ~/matlab/temp_${2}.m

ERRORDIR=/sps/inter/liris/afrenoy/errors/matlab
LOGDIR=/sps/inter/liris/afrenoy/logs/matlab
mkdir -p ${ERRORDIR}
mkdir -p ${LOGDIR}

# 30000 cpu should allow 5 replicates of 5000 generations with 10000 individuals when no recording
#qsub -e ${ERRORDIR} -o ${LOGDIR} -l matlab=1,sps=1,ct=70000,vmem=4000M,fsize=2000M -N ${2} << EOF
#qsub -e ${ERRORDIR} -o ${LOGDIR} -l matlab=1,sps=1,ct=20000,vmem=4000M,fsize=1000M -N ${2} << EOF
qsub -e ${ERRORDIR} -o ${LOGDIR} -l matlab=1,sps=1,ct=50000,vmem=4000M,fsize=1000M -N ${2} << EOF
matlab -nojvm -nodisplay -r 'temp_${2}'
EOF

echo "script temp_${2} created and launched"


## Infos:
# without 'liquid' option, cpu ~ 30000 (upper estimation). With 'liquid', cpu ~ 63000
# without 'record' option, fsize ~ xx M per replicate. with 'record', fsize ~ 200M per replicate ~ 1G per experiment (5 replicates)
