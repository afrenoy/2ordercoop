#!/bin/bash

hash=$(md5sum <<< $1 |cut -d ' ' -f 1)

# Create the script
touch ~/matlab/temp_${hash}.m
echo "path(path,'/afs/in2p3.fr/home/a/afrenoy/matlab');" >> ~/matlab/temp_${hash}.m
echo ${1} >> ~/matlab/temp_${hash}.m
echo "exit;" >> ~/matlab/temp_${hash}.m

ERRORDIR=/sps/inter/liris/afrenoy/errors/matlab
LOGDIR=/sps/inter/liris/afrenoy/logs/matlab
mkdir -p ${ERRORDIR}
mkdir -p ${LOGDIR}

qsub -e ${ERRORDIR} -o ${LOGDIR} -l matlab=1,sps=1,ct=30000,vmem=4000M,fsize=1000M -N t${hash} << EOF
matlab -nojvm -nodisplay -r 'temp_${hash}'
EOF

echo "script temp_${hash} created and launched"

