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
  wget -O - "https://coronavirus.sergas.gal/infodatos/${DATA_DATE}_COVID19_Web_CifrasTotais_PDIA.csv" | tail -n +2  | tr -d '\r' | grep -v "^$" >> CifrasTotais_PDIA_Autotest.csv 
else
  wget -O - "https://coronavirus.sergas.gal/infodatos/${DATA_DATE}_COVID19_Web_CifrasTotais_PDIA.csv" | tr -d '\r' | grep -v "^$" > CifrasTotais_PDIA_Autotest.csv 
fi

if [ -z $NOAPPEND ]; then
  wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_OcupacionCamasHospital.csv" | tail -n +2 | tr -d '\r' | grep -v "^$" >> OcupacionCamasHospital.csv
else
  wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_OcupacionCamasHospital.csv" | tr -d '\r' | grep -v "^$" > OcupacionCamasHospital.csv
fi

# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_ActivosCuradosFallecidos.csv" | tr -d '\r' | grep -v "^$" > ActivosCuradosFallecidos.csv


# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_InfectadosPorFecha_PDIA_Autotest.csv" | tr -d '\r' | grep -v "^$" > InfectadosPorFecha_PDIA_Autotest.csv


# acumulado
if [ -z $NOAPPEND ]; then
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_Fallecidos.csv" | tail -n +2 | tr -d '\r' | grep -v "^$" | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{print _fecha,$1,$2,$3,$4}' >> Fallecidos.csv
else
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_Fallecidos.csv" | tr -d '\r' | grep -v "^$" | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{if (NR==1) {_fecha="Fecha"} else {_fecha=fecha} print _fecha,$1,$2,$3,$4}' > Fallecidos.csv
fi

# serie
wget -O - "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfeccionesPorFecha.csv" | tr -d '\r' | grep -v "^$" > PorcentajeInfeccionesPorFecha.csv


# acumulado 
if [ -z $NOAPPEND ]; then
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfectadosPorGenero.csv" |tail -n +2 | tr -d '\r' | grep -v "^$" | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{print _fecha,$1,$2,$3,$4}' >> PorcentajeInfectadosPorGenero.csv
else
wget -O -  "https://coronavirus.sergas.es/infodatos/${DATA_DATE}_COVID19_Web_PorcentajeInfectadosPorGenero.csv" | tr -d '\r' | grep -v "^$" | awk -v fecha="\"${DATA_DATE}\"" -e 'BEGIN{OFS=","; FS=","; FPAT = "([^,]+)|(\"[^\"]+\")"; _fecha=fecha}{if (NR==1) {_fecha="Fecha"} else {_fecha=fecha} print _fecha,$1,$2,$3,$4}' > PorcentajeInfectadosPorGenero.csv
fi

# vacunas
wget -O - "https://coronavirus.sergas.gal/infovacinacion/${PUBDATE}_VACINAS_vacinacion_por_grupo_de_risco.csv" > vacunacion/$(date --date "$PUBDATE" "+%Y%m%d")_vacunacion_por_grupo_de_riesgo.csv
wget -O - "https://coronavirus.sergas.gal/infovacinacion/${PUBDATE}_VACINAS_cronometro.csv" > vacunacion/$(date --date "$PUBDATE" "+%Y%m%d")_vacunacion_situacion_general.csv
wget -O - "https://coronavirus.sergas.gal/infovacinacion/${PUBDATE}_VACINAS_vacinacion_por_sexo_e_idade.csv" > vacunacion/$(date --date "$PUBDATE" "+%Y%m%d")_vacunacion_sexo_edad.csv
