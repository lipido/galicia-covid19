#!/bin/bash

#fecha de publicación de los datos (por defecto será la de invocación del script)
PUBDATE=$1

# machacar ficheros
NOAPPEND=$2

if [ -z $PUBDATE ]; then
  PUBDATE=$(date +"%Y-%m-%d")
fi


DATA_DATE=$(date --date "$PUBDATE -1 days" "+%Y-%m-%d")

if [ -z $NOAPPEND ]; then
  wget -O - "https://coronavirus.sergas.gal/infodatos/${DATA_DATE}_COVID19_Web_CifrasTotais.csv" | tail -n +2 | tr -d '\r' >> CifrasTotais.csv 
else
  wget -O - "https://coronavirus.sergas.gal/infodatos/${DATA_DATE}_COVID19_Web_CifrasTotais.csv" | tr -d '\r' > CifrasTotais.csv 
fi

if [ -z $NOAPPEND ]; then
  wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_OcupacionCamasHospital.csv" | tail -n +2 | tr -d '\r' >> OcupacionCamasHospital.csv
else
  wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_OcupacionCamasHospital.csv" | tr -d '\r' > OcupacionCamasHospital.csv
fi

# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_ActivosCuradosFallecidos.csv" | tr -d '\r' > ActivosCuradosFallecidos.csv


# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_InfectadosPorFecha.csv" | tr -d '\r' > InfectadosPorFecha.csv


# acumulado
if [ -z $NOAPPEND ]; then
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_Fallecidos.csv" | tail -n +2 | tr -d '\r' | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{print _fecha,$1,$2,$3,$4}' >> Fallecidos.csv
else
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_Fallecidos.csv" | tr -d '\r' | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{if (NR==1) {_fecha="Fecha"} else {_fecha=fecha} print _fecha,$1,$2,$3,$4}' > Fallecidos.csv
fi

# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfeccionesPorFecha.csv" | tr -d '\r' > PorcentajeInfeccionesPorFecha.csv


# acumulado 
if [ -z $NOAPPEND ]; then
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfectadosPorGenero.csv" |tail -n +2 | tr -d '\r' | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{print _fecha,$1,$2,$3,$4}' >> PorcentajeInfectadosPorGenero.csv
else
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfectadosPorGenero.csv" | tr -d '\r' | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{if (NR==1) {_fecha="Fecha"} else {_fecha=fecha} print _fecha,$1,$2,$3,$4}' > PorcentajeInfectadosPorGenero.csv
fi
