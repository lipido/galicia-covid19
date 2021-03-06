#!/usr/bin/env Rscript

library("stringr");

args = commandArgs(trailingOnly=TRUE)

if (length(args) < 1) {
	stop("Se necesita el parametro de fecha. Ejemplo: 20201023");
}

fecha <- args[1]

habitantes <- read.csv(file="municipios-habitantes.csv", sep=",", header=TRUE)
casos <- read.csv(file=sprintf("../datos_nueva_web_sergas/mapas_concellos/%s_mapa-concellos-incidencia-7dias-14dias.csv", fecha), sep=",", header=TRUE)

for (i in 1:nrow(habitantes)) {
  
  habitantes[i, "fecha"] <- format(as.Date(fecha, format = "%Y%m%d"), "%Y-%m-%d")
  habitantes[i,"CASOS14"]=as.character(gsub("\\.", "", casos[casos[,"ID"]==habitantes[i,"codigo"],"CASOS_14_DIAS"]))
  habitantes[i,"CASOS7"]=as.character(gsub("\\.", "", casos[casos[,"ID"]==habitantes[i,"codigo"],"CASOS_7_DIAS"]))
  habitantes[i, "codigo_municipio"]=substr(habitantes[i, "codigo"], nchar(habitantes[i, "codigo"])-5+1, nchar(habitantes[i, "codigo"]))
  
  if (grepl("Sen", habitantes[i, "CASOS14"])) {
    habitantes[i, "casos_14d"] <- 0
  } else {
    habitantes[i, "casos_14d"] <- as.integer(str_match(habitantes[i, "CASOS14"], "no concello: ([0-9]+)")[1,2])
  }
  
  if (grepl("Sen", habitantes[i, "CASOS7"])) {
    habitantes[i, "casos_7d"] <- 0
  } else {
    habitantes[i, "casos_7d"] <- as.integer(str_match(habitantes[i, "CASOS7"], "no concello: ([0-9]+)")[1,2])
  }
  
  habitantes[i, "casos_14d_min"] <- as.integer(str_match(habitantes[i, "CASOS14"], "entre ([0-9]+) e")[1,2])
  habitantes[i, "casos_14d_max"] <- as.integer(str_match(habitantes[i, "CASOS14"], "entre [0-9]+ e ([0-9]+)")[1,2])
  
  habitantes[i, "casos_7d_min"] <- as.integer(str_match(habitantes[i, "CASOS7"], "entre ([0-9]+) e")[1,2])
  habitantes[i, "casos_7d_max"] <- as.integer(str_match(habitantes[i, "CASOS7"], "entre [0-9]+ e ([0-9]+)")[1,2])
  
  
  habitantes[i, "IA14"] <- habitantes[i, "casos_14d"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA14_min"] <- habitantes[i, "casos_14d_min"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA14_max"] <- habitantes[i, "casos_14d_max"] / habitantes[i,"habitantes"] * 100000
  
  habitantes[i, "IA7"] <- habitantes[i, "casos_7d"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA7_min"] <- habitantes[i, "casos_7d_min"] / habitantes[i,"habitantes"] * 100000
  habitantes[i, "IA7_max"] <- habitantes[i, "casos_7d_max"] / habitantes[i,"habitantes"] * 100000
  
}

incidencia <- habitantes[, c("fecha", "codigo_municipio", "municipio", "habitantes", "casos_14d", "casos_14d_min", "casos_14d_max", "IA14", "IA14_min", "IA14_max","casos_7d", "casos_7d_min", "casos_7d_max", "IA7", "IA7_min", "IA7_max")]
write.csv(file=sprintf("../incidencia-municipios/%s_incidencia_14d_7d_municipios.csv", fecha), incidencia, row.names=FALSE)
