#!/bin/bash

diff $1 $2 | awk -e 'BEGIN{FS=","}{if (NR%2==0){ if(NR%4==0)print $4; else print}}' | sed -e 's/[<>] //g' | cut -d ',' -f 3,4 | awk '{if(NR%2!=0){printf "%s ",$0;next;}}1' | sed -e 's/\(.*\)Nivel de alerta \([0-9]\).*Nivel de alerta \([0-9]\).*/\1 \2 -> \3/g'

