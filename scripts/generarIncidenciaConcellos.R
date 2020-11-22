#!/usr/bin/env Rscript

library("stringr");

args = commandArgs(trailingOnly=TRUE)

if (length(args) < 1) {
	stop("Se necesita el parametro de fecha. Ejemplo: 20201023");
}

fecha <- args[1]

habitantes <- read.csv(file="municipios-habitantes.csv", sep=",", header=TRUE)
casos <- read.csv(file=sprintf("../datos_nueva_web_sergas/mapas_concellos/%s_mapa-concellos-incidencia-14dias.csv", fecha), sep=",", header=TRUE)

for (i in 1:nrow(habitantes)) {
  
  habitantes[i, "fecha"] <- format(as.Date(fecha, format = "%Y%m%d"), "%Y-%m-%d")
  habitantes[i,"CASOS"]=casos[casos[,"ID"]==habitantes[i,"codigo"],"CASOS"] 
  
  habitantes[i, "casos_14d"] <- as.integer(str_match(habitantes[i, "CASOS"], "no concello: ([0-9]+)")[1,2])
  habitantes[i, "casos_14d_min"] <- as.integer(str_match(habitantes[i, "CASOS"], "entre ([0-9]+) e")[1,2])
  habitantes[i, "casos_14d_max"] <- as.integer(str_match(habitantes[i, "CASOS"], "entre [0-9]+ e ([0-9]+)")[1,2])
  
  habitantes[i, "IA14"] <- habitantes[i, "casos_14d"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA14_min"] <- habitantes[i, "casos_14d_min"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA14_max"] <- habitantes[i, "casos_14d_max"] / habitantes[i,"habitantes"] * 100000
  
}

incidencia <- habitantes[, c("fecha", "municipio", "habitantes", "casos_14d", "casos_14d_min", "casos_14d_max", "IA14", "IA14_min", "IA14_max")]
write.csv(file=sprintf("../incidencia-municipios/%s_incidencia_14d_municipios.csv", fecha), incidencia, row.names=FALSE)
