#!/bin/bash
wget "https://cnecovid.isciii.es/covid19/resources/casos_tecnica_provincia.csv" -O /tmp/datos_isciii.csv
for i in OR PO C LU; do
    head -n 1 /tmp/datos_isciii.csv | cut -d "," -f 2- > $i.csv;
    cat /tmp/datos_isciii.csv | grep ^${i}, | cut -d "," -f 2- >> $i.csv;
done; 
mv OR.csv ../casos.ourense.csv; 
mv PO.csv ../casos.pontevedra.csv; 
mv LU.csv ../casos.lugo.csv; 
mv C.csv ../casos.coruna.csv;
