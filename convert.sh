#!/bin/bash

#On 2017-01-04, adding a new argument 'sterile' to both s2 and repls2 -> change existing files
#for i in exp1_cth_phenotypic.sh exp1_cth.sh exp1_ctl_phenotypic.sh exp1_ctl.sh exp1_liquid.sh exp1_phenotypic.sh exp1.sh exp3_cth_phenotypic.sh exp3_cth.sh exp3_ctl.sh exp3_liquid.sh exp3_phenotypic.sh exp3.sh exp4_cth_phenotypic.sh exp4_cth.sh exp4_ctlh.sh exp4_ctl.sh exp4_liquid.sh exp4_phenotypic.sh exp4.sh from0_formovies.sh invasion1.sh invasion2.sh invasion4.sh varyLH.sh
#do
#  sed -i -e 's/false, true )/false, false, true )/g' -e 's/true, false )/true, false, false )/g' $i
#done

# We rename exp3 into exp2 and exp4 into exp3 at same date
for i in exp3_cth_phenotypic.sh exp3_cth.sh exp3_ctl.sh exp3_liquid.sh exp3_phenotypic.sh exp3.sh
do
  sed -i 's/\/exp3/\/exp2/g' $i
done
