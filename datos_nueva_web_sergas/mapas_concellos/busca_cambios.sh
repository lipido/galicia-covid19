#!/bin/bash

diff -y $1 $2 | grep "|" | cut -d ',' -f 3,4,7  | tr -d '"' | sed -e 's/\(.*\)Nivel de alerta \([0-9]\).*Nivel de alerta \([0-9]\).*/\1 \2 → \3/g'

