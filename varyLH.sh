#!/bin/bash

function runLH {
  mkdir /sps/inter/liris/afrenoy/S2/L${1}H${2}
  for cost in 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9; do
    bf=$(bc <<< "${cost}-0.125")
    for pressure in 1 2 5 10 20 50 100 200; do
      ./launchmatlabcommandrnd.sh "repls2( '/sps/inter/liris/afrenoy/S2/L${1}H${2}/c${cost}mexp${pressure}', 5, 2000, 100, 100, $1, $1, $2, $2, 0.001, 0.001, ${bf}, ${cost}, 1.125, ${pressure}, false, true);"
    done
  done
}

runLH 0.01 0.5
runLH 0.1 0.5

runLH 0.005 0.05
runLH 0.01 0.1
runLH 0.05 0.5
