#!/bin/bash

p=$(pwd)
/Applications/MATLAB_R2016b.app/Contents/MacOS/MATLAB_maci64 -r "path(path,'$p/../code_model/');path(path,'$p/../code_analysis/');$1;exit()"

