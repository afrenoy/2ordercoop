#!/bin/bash
# This is syntax of "repls2" matlab function:
#repls2( basepath, nrep,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,record )

# This is an example launch
#./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0107/b1c0.5', 3, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 1, 0.5, 1, 1, false, false );" j$RANDOM
# It took 14448 a.u. cpu time, 1.059G vmem, 2.4M disk space

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp1', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp2', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp5', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp10', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp20', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.4mexp50', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.275, 0.4, 1.125, 50, false, true );" j$RANDOM

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp1', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp2', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp5', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp10', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp20', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.6mexp50', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.475, 0.6, 1.125, 50, false, true );" j$RANDOM

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp1', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp2', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp5', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp10', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp20', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/param2cth/c0.8mexp50', 3, 2000, 100, 100, 0.01, 0.01, 0.01, 0.01, 0.001, 0.001, 0.675, 0.8, 1.125, 50, false, true );" j$RANDOM
