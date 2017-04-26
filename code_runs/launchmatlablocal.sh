#!/bin/bash

p=$(pwd)/../code_model/
/Applications/MATLAB_R2016b.app/Contents/MacOS/MATLAB_maci64 -nojvm -nodisplay -r "path(path,'$p');$1;exit()"

