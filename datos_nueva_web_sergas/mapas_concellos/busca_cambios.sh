#!/bin/bash

diff -y $1 $2 | grep "|" | cut -d ',' -f 3,2,5 | tr -d '"'| awk -e 'BEGIN{FS=","}{print $2,$1"→"$3}'
