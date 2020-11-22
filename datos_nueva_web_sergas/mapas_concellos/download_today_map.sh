#!/bin/bash
DATE=$(date +"%Y%m%d")


MAP_ID=$(wget -O - https://coronavirus.sergas.es/datos/libs/hot-config/hot-config.txt | grep CASES_MAP | sed -e 's/.*: "\(.*\)".*/\1/g')

# redirect if needed...

wget -O /tmp/mapa-covid.html https://datawrapper.dwcdn.net/${MAP_ID}/1/



while [ "$(grep "REFRESH" /tmp/mapa-covid.html | wc -l)" -ne "0" ]; do
  new_url=$(cat /tmp/mapa-covid.html | sed -e 's/.*url=\(.*\)".*/\1/g' | tr -d '\r' | tr -d '\n')
  echo "following to: ${new_url}"
  wget -O /tmp/mapa-covid.html "${new_url}"
done




cat /tmp/mapa-covid.html | grep chartData| sed -e 's/.*chartData\\":\\"\(.*\)\\".*isPreview.*/\1/g' | sed -e 's/\\n/\n/g' | sed -e 's/\\r/\r/g' | tr -d '\r' |tr -d '\' | grep -v "^\",$" | sed -e 's/u00D1/Ñ/g' | sed -e 's/u00E1/á/g' | sed -e 's/u00FA/ú/g'> ${DATE}_mapa-concellos-incidencia-14dias.csv

