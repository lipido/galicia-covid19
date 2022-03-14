#!/bin/bash

function write_data_and_empty_line_if_needed {
    today_date=$(echo "$1" | cut -d ',' -f 1)
    if [ "$(date -d "$today_date" +%u)" -eq "1" ]; then
        echo "Today is monday. An empty line will be added to '$2', since no data is published on Sunday"; 
        previous_day=$(date --date "$today_date -1 days" "+%Y-%m-%d")
        echo -n "${previous_day}," >> "$2"
        echo "$1" | sed -e 's/,[0-9]*/,NA/g' | cut -d "," -f 2- >> "$2"
    fi
    echo "$1" >> "$2"
}

today_data=$(./download-today-web-sergas.sh "$1")
OUTPUT_DIR=../


#Galicia
galicia_line=$(echo "$today_data" | cut -d $'\t' -f 1-4,6 | tr '\t' ',')
write_data_and_empty_line_if_needed "${galicia_line}" $OUTPUT_DIR/galicia.csv


#Coruña
coruna_line=$(echo "$today_data" | cut -d $'\t' -f 1,7-9,11  | tr '\t' ',')
write_data_and_empty_line_if_needed "${coruna_line}" $OUTPUT_DIR/coruna.csv

coruna_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,12-18 | tr '\t' ',')
write_data_and_empty_line_if_needed "${coruna_ext_line}" $OUTPUT_DIR/coruna.ext.csv

#Vigo
vigo_line=$(echo "$today_data" | cut -d $'\t' -f 1,19-21,23 | tr '\t' ',')
write_data_and_empty_line_if_needed "${vigo_line}" $OUTPUT_DIR/vigo.csv

vigo_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,24-30 | tr '\t' ',')
write_data_and_empty_line_if_needed "${vigo_ext_line}" $OUTPUT_DIR/vigo.ext.csv

#Santiago
santiago_line=$(echo "$today_data" | cut -d $'\t' -f 1,31-33,35 | tr '\t' ',')
write_data_and_empty_line_if_needed "${santiago_line}" $OUTPUT_DIR/santiago.csv


santiago_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,36-42 | tr '\t' ',')
write_data_and_empty_line_if_needed "${santiago_ext_line}" $OUTPUT_DIR/santiago.ext.csv


#Pontevedra
pontevedra_line=$(echo "$today_data" | cut -d $'\t' -f 1,43-45,47 | tr '\t' ',')
write_data_and_empty_line_if_needed "${pontevedra_line}" $OUTPUT_DIR/pontevedra.csv

pontevedra_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,48-54 | tr '\t' ',')
write_data_and_empty_line_if_needed "${pontevedra_ext_line}" $OUTPUT_DIR/pontevedra.ext.csv

#Ourense
ourense_line=$(echo "$today_data" | cut -d $'\t' -f 1,55-57,59 | tr '\t' ',')
write_data_and_empty_line_if_needed "${ourense_line}" $OUTPUT_DIR/ourense.csv

ourense_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,60-72 | tr '\t' ',') 
write_data_and_empty_line_if_needed "${ourense_ext_line}" $OUTPUT_DIR/ourense.ext.csv


#Lugo
lugo_line=$(echo "$today_data" | cut -d $'\t' -f 1,73-75,77 | tr '\t' ',')
write_data_and_empty_line_if_needed "${lugo_line}" $OUTPUT_DIR/lugo.csv

lugo_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,78-84 | tr '\t' ',')
write_data_and_empty_line_if_needed "${lugo_ext_line}" $OUTPUT_DIR/lugo.ext.csv


#Ferrol
ferrol_line=$(echo "$today_data" | cut -d $'\t' -f 1,85-87,89 | tr '\t' ',')
write_data_and_empty_line_if_needed "${ferrol_line}" $OUTPUT_DIR/ferrol.csv


ferrol_ext_line=$(echo "$today_data" | cut -d $'\t' -f 1,90-96 | tr -d '\r' | tr '\t' ',')
write_data_and_empty_line_if_needed "${ferrol_ext_line}" $OUTPUT_DIR/ferrol.ext.csv
