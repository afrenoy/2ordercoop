#!/bin/bash

# On 2017-01-04, adding a new argument 'sterile' to both s2 and repls2 -> change existing files
#for i in exp1_cth_phenotypic.sh exp1_cth.sh exp1_ctl_phenotypic.sh exp1_ctl.sh exp1_liquid.sh exp1_phenotypic.sh exp1.sh exp3_cth_phenotypic.sh exp3_cth.sh exp3_ctl.sh exp3_liquid.sh exp3_phenotypic.sh exp3.sh exp4_cth_phenotypic.sh exp4_cth.sh exp4_ctlh.sh exp4_ctl.sh exp4_liquid.sh exp4_phenotypic.sh exp4.sh from0_formovies.sh invasion1.sh invasion2.sh invasion4.sh varyLH.sh
#do
#  sed -i -e 's/false, true )/false, false, true )/g' -e 's/true, false )/true, false, false )/g' $i
#done

# We rename exp3 into exp2 and exp4 into exp3 at same date
#for i in exp3_cth_phenotypic.sh exp3_cth.sh exp3_ctl.sh exp3_liquid.sh exp3_phenotypic.sh exp3.sh
#do
#  sed -i 's/\/exp3/\/exp2/g' $i
#  git mv $i ${i/exp3/exp2}
#done

#for i in exp4_cth_phenotypic.sh exp4_cth.sh exp4_ctlh.sh exp4_ctl.sh exp4_liquid.sh exp4_phenotypic.sh exp4.sh
#do
#  sed -i 's/\/exp4/\/exp3/g' $i
#  git mv $i ${i/exp4/exp3}
#done

#git mv invasion4.sh invasion3.sh

# On 2016-01-07, refactor all scripts to use launchmatlabcommandrnd.sh (and not launchmatlabcommand.sh which is prone to collision errors in random number generation)
#for f in exp1.sh exp1_cth.sh exp1_ctl.sh exp1_phenotypic.sh exp1_cth_phenotypic.sh exp1_ctl_phenotypic.sh exp1_liquid.sh exp2.sh exp2_cth.sh exp2_ctl.sh exp2_liquid.sh exp2_phenotypic.sh exp3.sh exp3_cth.sh exp3_ctl.sh exp3_liquid.sh exp3_phenotypic.sh exp3_ctlh.sh
#do
#  sed -i .bak 's/launchmatlabcommand.sh \(".*"\) j\$RANDOM/launchmatlabcommandrnd.sh \1/g' $f
#done

# Rename output dir for consistency
#sed -i .bak 's/exp1cth/exp1_cth/g' exp1_cth.sh
#sed -i .bak 's/exp1ctl/exp1_ctl/g' exp1_ctl.sh
#sed -i .bak 's/exp2cth/exp2_cth/g' exp2_cth.sh
#sed -i .bak 's/exp2ctl/exp2_ctl/g' exp2_ctl.sh
#sed -i .bak 's/exp3cth/exp3_cth/g' exp3_cth.sh
#sed -i .bak 's/exp3ctl/exp3_ctl/g' exp3_ctl.sh

#sed -i .bak 's/exp1sterile/exp1_sterile/g' exp1_sterile.sh

#sed -i .bak 's/lexp1/exp1_liquid/g' exp1_liquid.sh
#sed -i .bak 's/lexp2/exp2_liquid/g' exp2_liquid.sh
#sed -i .bak 's/lexp3/exp3_liquid/g' exp3_liquid.sh
