#!/bin/bash
# Was previously mexp_09072014.sh
# This is syntax of "repls2" matlab function:
#repls2( basepath, nrep,ngen,sizex,sizey,def_mutdc,def_mutcd,evo_mutdc,evo_mutcd,mut_mutcoop,mut_neutral,basefitness,cost,benefit,mexp,liquid,record )

# This is an example launch
#./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0107/b1c0.5', 3, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 1, 0.5, 1, 1, false, false );" j$RANDOM
# It took 14448 a.u. cpu time, 1.059G vmem, 2.4M disk space

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp1', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp2', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp5', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp10', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp20', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.5mexp50', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.375, 0.5, 1.125, 50, false, true );" j$RANDOM

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp1', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp2', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp5', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp10', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp20', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.3mexp50', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.175, 0.3, 1.125, 50, false, true );" j$RANDOM

./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp1', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 1, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp2', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 2, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp5', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 5, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp10', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 10, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp20', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 20, false, true );" j$RANDOM
./launchmatlabcommand.sh "repls2( '/sps/inter/liris/afrenoy/S2/0907/c0.7mexp50', 5, 5000, 100, 100, 0.001, 0.001, 0.01, 0.01, 0.001, 0.001, 0.575, 0.7, 1.125, 50, false, true );" j$RANDOM
