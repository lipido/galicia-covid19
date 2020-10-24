#!/usr/bin/env Rscript

library("stringr");

args = commandArgs(trailingOnly=TRUE)

if (length(args) < 1) {
	stop("Se necesita el parametro de fecha. Ejemplo: 20201023");
}

fecha <- args[1]

mapa_incidencia_habitantes <- read.csv(file="mapa-incidencia-municipios-habitantes.csv", sep=",", header=TRUE)
casos <- read.csv(file=sprintf("../datos_nueva_web_sergas/mapas_concellos/%s_mapa-concellos-14dias.csv", fecha), sep=",", header=TRUE)

for (i in 1:nrow(mapa_incidencia_habitantes)) { 
  mapa_incidencia_habitantes[i,"detalle_nivel"]=casos[casos[,"ID"]==mapa_incidencia_habitantes[i,"codigo"],"Detalle_Nivel"] 
  
  mapa_incidencia_habitantes[i, "incidencia"] <- as.integer(str_match(mapa_incidencia_habitantes[i, "detalle_nivel"], "( máis de | entre )([0-9]+)")[1,3])/ mapa_incidencia_habitantes[i,"habitantes"] *100000
  
}

datos_datawrapper <- mapa_incidencia_habitantes[, c("codigo", "municipio", "incidencia", "habitantes")]
datos_datawrapper[is.na(datos_datawrapper[,3]), 3] <- 0
datos_datawrapper <- datos_datawrapper[datos_datawrapper[,4] > 5000, ]
write.csv(file=sprintf("./%s_datawrapper-incidencia.csv", fecha), datos_datawrapper, row.names=FALSE)
