#!/bin/bash

today_data=$(./download-today-web-sergas.sh $1)
OUTPUT_DIR=../


#Galicia
echo "$today_data" | cut -d $'\t' -f 1-4,6 | tr '\t' ',' >> $OUTPUT_DIR/galicia.csv

#Coruña
echo "$today_data" | cut -d $'\t' -f 1,7-9,11  | tr '\t' ',' >> $OUTPUT_DIR/coruna.csv
echo "$today_data" | cut -d $'\t' -f 1,12-18 | tr '\t' ',' >> $OUTPUT_DIR/coruna.ext.csv

#Vigo
echo "$today_data" | cut -d $'\t' -f 1,19-21,23 | tr '\t' ',' >> $OUTPUT_DIR/vigo.csv
echo "$today_data" | cut -d $'\t' -f 1,24-30 | tr '\t' ',' >> $OUTPUT_DIR/vigo.ext.csv

#Santiago
echo "$today_data" | cut -d $'\t' -f 1,31-33,35 | tr '\t' ',' >> $OUTPUT_DIR/santiago.csv
echo "$today_data" | cut -d $'\t' -f 1,36-42 | tr '\t' ',' >> $OUTPUT_DIR/santiago.ext.csv

#Pontevedra
echo "$today_data" | cut -d $'\t' -f 1,43-45,47 | tr '\t' ',' >> $OUTPUT_DIR/pontevedra.csv
echo "$today_data" | cut -d $'\t' -f 1,48-54 | tr '\t' ',' >> $OUTPUT_DIR/pontevedra.ext.csv

#Ourense
echo "$today_data" | cut -d $'\t' -f 1,55-57,59 | tr '\t' ',' >> $OUTPUT_DIR/ourense.csv
echo "$today_data" | cut -d $'\t' -f 1,60-72 | tr '\t' ',' >> $OUTPUT_DIR/ourense.ext.csv

#Lugo
echo "$today_data" | cut -d $'\t' -f 1,73-75,77 | tr '\t' ',' >> $OUTPUT_DIR/lugo.csv
echo "$today_data" | cut -d $'\t' -f 1,78-84 | tr '\t' ',' >> $OUTPUT_DIR/lugo.ext.csv

#Ferrol
echo "$today_data" | cut -d $'\t' -f 1,85-87,89 | tr '\t' ',' >> $OUTPUT_DIR/ferrol.csv
echo "$today_data" | cut -d $'\t' -f 1,90-96 | tr -d '\r' | tr '\t' ',' >> $OUTPUT_DIR/ferrol.ext.csv

