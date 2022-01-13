#!/bin/bash

#fecha de publicación de los datos (por defecto será la de invocación del script)
PUBDATE=$1

if [ -z $PUBDATE ]; then
  PUBDATE=$(date +"%Y-%m-%d")
fi

DATA_DATE=$(date --date "$PUBDATE -1 days" "+%Y-%m-%d")

wget -O /tmp/datos_sergas.csv "https://coronavirus.sergas.gal/infodatos/${DATA_DATE}_COVID19_Web_CifrasTotais_PDIA.csv"

wget -O /tmp/hospitales.csv "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_OcupacionCamasHospital.csv"

declare -A areas
areas["ourense"]="OURENSE"
areas["coruna"]="CORU"
areas["ferrol"]="FERROL"
areas["santiago"]="SANTIAGO"
areas["lugo"]="LUGO"
areas["pontevedra"]="PONTEVEDRA"
areas["vigo"]="VIGO"
areas["galicia"]="GALICIA"

declare -A casos
declare -A altas
declare -A fallecidos
declare -A pcr
declare -A no_pdia
declare -A antigeno
declare -A casos_abiertos_24h
declare -A planta
declare -A uci
declare -A hospitalizados
declare -A activos
declare -A domicilio


for FICHERO_AREA in "${!areas[@]}"; do
  # Print the KEY value
  
  # Print the VALUE attached to that KEY
  linea_area=$(cat /tmp/datos_sergas.csv | grep ${areas[$FICHERO_AREA]})
  
  variables=(casos casos_abiertos_24h altas fallecidos pcr planta uci activos no_pdia antigeno)
  columnas=(3 4 6 11 9 7 8 5 10 12)
  for ((i = 0; i < ${#variables[@]}; ++i)); do
    # bash arrays are 0-indexed
    variable=${variables[$i]}
    valor=$(echo $linea_area |  awk -v col=${columnas[$i]} -e 'BEGIN{FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"}{print $col}' | tr -d "\"" | tr -d "."| tr -d "\r")
    eval "${variable}[$FICHERO_AREA]=$valor"
    
   # echo ${array["hola"]}
  done
  
done

for FICHERO_AREA in "${!areas[@]}"; do
  hospitalizados[$FICHERO_AREA]=$((${planta[$FICHERO_AREA]} + ${uci[$FICHERO_AREA]}))
  domicilio[$FICHERO_AREA]=$((${activos[$FICHERO_AREA]} - ${hospitalizados[$FICHERO_AREA]}))
done

# hospitales Ourense

declare -A nombres_hospitales_ourense
declare -A hospitales_ourense_planta
declare -A hospitales_ourense_uci
declare -A hospitales_ourense_hospitalizados
nombres_hospitales_ourense["chuo"]="C.H.U"
nombres_hospitales_ourense["verin"]="VERIN"
nombres_hospitales_ourense["barco"]="VALDEORRAS"
nombres_hospitales_ourense["cosaga"]="TERESA"
nombres_hospitales_ourense["carmen"]="CARMEN"

for hospital_ourense in "${!nombres_hospitales_ourense[@]}"; do
  hospitales_ourense_planta[$hospital_ourense]=$(cat /tmp/hospitales.csv | grep "OURENSE" | grep ${nombres_hospitales_ourense[$hospital_ourense]} |  awk  -e 'BEGIN{FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"}{print $5}' | tr -d "\"" | tr -d "." | tr -d "\r")
  hospitales_ourense_uci[$hospital_ourense]=$(cat /tmp/hospitales.csv | grep "OURENSE" | grep ${nombres_hospitales_ourense[$hospital_ourense]} |  awk -e 'BEGIN{FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"}{print $6}' | tr -d "\"" | tr -d "\r")
  uci2=${hospitales_ourense_uci[$hospital_ourense]}
  planta=${hospitales_ourense_planta[$hospital_ourense]}
  hospitales_ourense_hospitalizados[$hospital_ourense]=$(($uci2 + $planta))
done 

#echo ${domicilio["galicia"]}


# Imprimir linea google drive

function imprimeArea {
  echo -ne ${casos[$area]}'\t'
  echo -ne ${altas[$area]}'\t'
  echo -ne ${fallecidos[$area]}'\t'
  echo -ne ${activos[$area]}'\t'
  echo -ne '\t' #nos saltamos los casos pcr 24h, ya que no se reporta esta informacion desde el 13/01/2022
  echo -ne ${domicilio[$area]}'\t'
  echo -ne ${hospitalizados[$area]}'\t'
  echo -ne ${uci[$area]}'\t'
  echo -ne ${pcr[$area]}'\t'
  echo -ne '\t'${antigeno[$area]}'\t'
  echo -ne ${no_pdia[$area]}
}

# Galicia
echo -ne $PUBDATE'\t'
echo -ne ${casos["galicia"]}'\t'
echo -ne ${altas["galicia"]}'\t'
echo -ne ${fallecidos["galicia"]}'\t'
echo -ne ${activos["galicia"]}'\t'
echo -ne ${confirmados_pcr_24h["galicia"]}

for area in coruna vigo santiago pontevedra; do
  echo -ne '\t'
  imprimeArea
done

area="ourense"
# Ourense
echo -ne '\t'
echo -ne ${casos[$area]}'\t'
echo -ne ${altas[$area]}'\t'
echo -ne ${fallecidos[$area]}'\t'
echo -ne ${activos[$area]}'\t'
echo -ne '\t' #nos saltamos los casos pcr 24h, ya que no se reporta esta informacion desde el 13/01/2022
echo -ne ${domicilio[$area]}'\t'
echo -ne ${hospitales_ourense_hospitalizados["chuo"]}'\t'
echo -ne ${hospitales_ourense_hospitalizados["carmen"]}'\t'
echo -ne ${hospitales_ourense_hospitalizados["cosaga"]}'\t'
echo -ne ${hospitales_ourense_hospitalizados["barco"]}'\t'
echo -ne ${hospitales_ourense_hospitalizados["verin"]}'\t'
echo -ne ${hospitales_ourense_uci["chuo"]}'\t'
echo -ne ${hospitales_ourense_uci["cosaga"]}'\t'
echo -ne ${hospitales_ourense_uci["carmen"]}'\t'
echo -ne ${pcr[$area]}'\t'
echo -ne '\t'${antigeno[$area]}'\t'
echo -ne ${no_pdia[$area]}

for area in lugo ferrol; do
  echo -ne '\t'
  imprimeArea
done
echo -ne '\n'
