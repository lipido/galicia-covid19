#!/bin/bash
DATE=$(date +"%Y%m%d")


MAP_7_ID=$(wget -O - https://coronavirus.sergas.es/datos/libs/hot-config/hot-config.txt | grep ID_MAP_1 | sed -e 's/.*: "\(.*\)".*/\1/g')
MAP_2_ID=$(wget -O - https://coronavirus.sergas.es/datos/libs/hot-config/hot-config.txt | grep ID_MAP_2 | sed -e 's/.*: "\(.*\)".*/\1/g')

# redirect if needed...

wget -O /tmp/mapa-covid-7.html https://datawrapper.dwcdn.net/${MAP_7_ID}/10/
wget -O /tmp/mapa-covid-14.html https://datawrapper.dwcdn.net/${MAP_2_ID}/10/

for i in 7 14; do
  if [ "$(grep "REFRESH" /tmp/mapa-covid-${i}.html | wc -l)" -ne "0" ]; then
    new_url=$(cat /tmp/mapa-covid-${i}.html | sed -e 's/.*url=\(.*\)".*/\1/g' | tr -d '\r' | tr -d '\n')
    echo "following to: ${new_url}"
    wget -O /tmp/mapa-covid-${i}.html "${new_url}"
  fi
done


for i in 7 14; do
  cat /tmp/mapa-covid-${i}.html | grep chartData| sed -e 's/.*chartData\\":\\"\(.*\)\\".*isPreview.*/\1/g' | sed -e 's/\\n/\n/g' | sed -e 's/\\r/\r/g' | tr -d '\r' |tr -d '\' | grep -v "^\",$" | sed -e 's/u00D1/Ñ/g' | sed -e 's/u00E1/á/g'> ${DATE}_mapa-concellos-${i}dias.csv
done
