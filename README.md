Datos COVID-19 Galicia
======================

Este repositorio contiene datos del COVID-19 para la Comunidad Autónoma de Galicia. Las fuentes son:
- Consellería de Sanidade (Xunta de Galicia). Proporciona datos a nivel global de la Comunidad Autónoma de Galicia y únicamente de casos activos por Área Sanitaria. A partir del 8/10/2020 con la [nueva web del SERGAS](https://coronavirus.sergas.es/datos), se extraen de la misma la mayoría de datos.
- Xerencia da Área Sanitaria de Ourense, Verín e O Barco de Valdeorras (SERGAS). Proporciona datos de detallados de Ourense y del resto de Áreas Sanitarias hasta el 7/10/2020.
- Instituto de Salud Carlos III. Proporciona la serie de casos por fecha de inicio de síntomas a nivel provincial.

Agradecimientos
---------------
- Servizo de Comunicación da Área Sanitaria do Sergas de Ourense, Verín e O Barco de Valdeorras ([@Com_CHUO](https://twitter.com/Com_CHUO)), por haber hecho posible este proyecto facilitando los datos detallados por Área Sanitaria.
- Ana Blasco ([@_ablasco](https://twitter.com/_ablasco)), periodista del Faro de Vigo, por facilitar datos históricos del Área Sanitaria de Vigo que faltaban.

Series históricas del SERGAS
----------------------------
Las series históricas proporcionadas por el SERGAS. Los ficheros son:

- `galicia.csv`. Serie histórica básica de Galicia (casos totales, activos, altas y fallecimientos). Las columnas son:
    - `Galicia.casos.acum`: Casos totales hasta la fecha. La Consellería de Sanidade publica los casos activos y no los casos totales como tal. Esta columna es la resultante de sumarle los fallecidos y las altas al dato de activos de la Consellería. Por tanto, los casos activos serían `Galicia.casos.acum` - `Galicia.altas.acum` - `Galicia.fallecidos.acum`.
    - `Galicia.altas.acum`: Altas totales hasta la fecha.
    - `Galicia.fallecidos.acum`: Fallecidos totales hasta la fecha.
    - `Galicia.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `ourense.csv`. Serie histórica básica del área sanitaria de Ourense, Verín e O Barco de Valdeorras. Las columnas son:
    - `Ourense.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Ourense.altas.acum`: Altas totales hasta la fecha. 
    - `Ourense.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Ourense.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `ourense.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Ourense, Verín e O Barco de Valdeorras. Las columnas son:
    - `Ourense.domicilio`: Casos activos con seguimiento a domicilio.
    - `Ourense.hospitalizados_HPCHUO`: Hospitalizados totales (UCI + planta) en el hospital CHUO (Complexo Hospitalario Universitario de Ourense) (público).
    - `Ourense.hospitalizados_Carmen`: Hospitalizados totales (UCI + planta) en la clínica El Carmen (privado).
    - `Ourense.hospitalizados_COSAGA`: Hospitalizados totales (UCI + planta) en la clínica el hospital CO.SA.GA (privado).
    - `Ourense.hospitalizados_HPValdeorras`: Hospitalizados totales (UCI + planta) en la clínica el hospital de O Barco de Valdeorras (público).
    - `Ourense.hospitalizados_HPVerin`: Hospitalizados totales (UCI + planta) en el hospital de Verín (público).
    - `Ourense.uci_HPCHUO`: Pacientes en UCI en el hospital CHUO (Complexo Hospitalario Universitario de Ourense) (público).
    - `Ourense.uci_COSAGA`: Pacientes en UCI en la clínica el hospital CO.SA.GA (privado).
    - `Ourense.uci_Carmen`: Pacientes en UCI en la clínica El Carmen (privado).
    - `Ourense.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en Ourense. Algunas pruebas PCR a pacientes de Ourense se hicieron en Vigo y no están contabilizadas aquí (*).
    - `Ourense.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria. Este dato deja de darse el 28 de Mayo de 2021.
    - `Ourense.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Ourense.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `lugo.csv`. Serie histórica básica del área sanitaria de Lugo, A Mariña e Monforte de Lemos. Las columnas son:
    - `Lugo.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Lugo.altas.acum`: Altas totales hasta la fecha. 
    - `Lugo.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Lugo.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `lugo.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Lugo, Cervo e Monforte de Lemos. Las columnas son. Las columnas son:
    - `Lugo.domicilio`: Casos activos con seguimiento a domicilio.
    - `Lugo.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Lugo.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Lugo.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `Lugo.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria. Este dato deja de darse el 28 de Mayo de 2021.
    - `Lugo.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Lugo.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `vigo.csv`. Serie histórica básica del área sanitaria de Vigo. Las columnas son:
    - `Vigo.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Vigo.altas.acum`: Altas totales hasta la fecha. 
    - `Vigo.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Vigo.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `vigo.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Vigo. Las columnas son. Las columnas son:
    - `Vigo.domicilio`: Casos activos con seguimiento a domicilio.
    - `Vigo.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Vigo.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Vigo.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `Vigo.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria de Vigo. Este dato deja de darse el 28 de Mayo de 2021.
    - `Vigo.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Vigo.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `pontevedra.csv`. Serie histórica básica del área sanitaria de Pontevedra e O Salnés. Las columnas son:
    - `Pontevedra.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Pontevedra.altas.acum`: Altas totales hasta la fecha. 
    - `Pontevedra.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Pontevedra.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `pontevedra.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Pontevedra e O Salnés. Las columnas son. Las columnas son:
    - `Pontevedra.domicilio`: Casos activos con seguimiento a domicilio.
    - `Pontevedra.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Pontevedra.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Pontevedra.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `Pontevedra.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria. Este dato deja de darse el 28 de Mayo de 2021.
    - `Pontevedra.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Pontevedra.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `santiago.csv`. Serie histórica básica del área sanitaria de Santiago de Compostela e Barbanza. Las columnas son:
    - `Santiago.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Santiago.altas.acum`: Altas totales hasta la fecha. 
    - `Santiago.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Santiago.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `santiago.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Santiago de Compostela e Barbanza. Las columnas son. Las columnas son:
    - `Santiago.domicilio`: Casos activos con seguimiento a domicilio.
    - `Santiago.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Santiago.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Santiago.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `Santiago.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria de Santiago. Este dato deja de darse el 28 de Mayo de 2021.
    - `Santiago.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Santiago.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `coruna.csv`. Serie histórica básica del área sanitaria de A Coruña e Cee. Las columnas son:
    - `A_Coruña.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `A_Coruña.altas.acum`: Altas totales hasta la fecha. 
    - `A_Coruña.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `A_Coruña.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.
- `coruna.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de A Coruña e Cee. Las columnas son. Las columnas son:
    - `A_Coruña.domicilio`: Casos activos con seguimiento a domicilio.
    - `A_Coruña.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `A_Coruña.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `A_Coruña.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `A_Coruña.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria. Este dato deja de darse el 28 de Mayo de 2021.
    - `A_Coruña.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `A_Coruña.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
- `ferrol.csv`. Serie histórica básica del área sanitaria de Ferrol. Las columnas son:
    - `Ferrol.casos.acum`: Casos totales hasta la fecha. Los casos son tanto con PCR positiva, como anticuerpos. La mayoría son PCR+, pero no todos.
    - `Ferrol.altas.acum`: Altas totales hasta la fecha. 
    - `Ferrol.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
    - `Ferrol.confirmados_pcr_24h`: Nuevos casos confirmados por PCR en las últimas 24h. Disponible desde 8/10/2020.    
- `ferrol.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Ferrol. Las columnas son. Las columnas son:
    - `Ferrol.domicilio`: Casos activos con seguimiento a domicilio.
    - `Ferrol.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Ferrol.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Ferrol.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria (*).
    - `Ferrol.serologicas.acum`: Total de pruebas serológicas hechas hasta la fecha en el área sanitaria. Este dato deja de darse el 28 de Mayo de 2021.
    - `Ferrol.antigeno.acum`: Total de pruebas de antígeno hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    - `Ferrol.no_pdia.acum`: Total de pruebas que no se consideran PDIA (Pruebas Diagnósticas de Infección Activa, como lo sería PCR o antígeno) hechas hasta la fecha en el área sanitaria. Este dato se da a partir del 28 de Mayo de 2021.
    

Por otra parte se incluye un fichero que contiene la correspondencia entre municipios y áreas sanitarias. Las columnas son:
- `municipios-areas-csv`.
    - `municipio`.
    - `provincia`.
    - `area_sanitaria`.

(*) Hasta el 29/09/2020, las PCR en un área sanitaria eran las PCR que se hacían en laboratorios de dicha área, independientemente del área sanitaria del paciente donde se originó la solicitud. Por ejemplo: Ourense solicitó un gran número de PCR a Vigo. **A partir del 29/09/2020** el acumulado de PCR comienza a registrar las PCR *solicitadas* para pacientes de dicha área, independientemente de la ubicación del laboratorio donde se realice la PCR. Esto mejora la estimación de la positividad por área sanitaria si se calculase como casos/PCR. Nota: No se hace una corrección retroactiva del acumulado, sino que a partir de esta fecha los acumulados se incrementan siguiendo este nuevo protocolo.

Series de casos confirmados en el ISCIII RENAVE
-----------------------------------------------
Estos ficheros contienen las series de casos *por fecha de inicio de síntomas o, en su defecto, de diagnóstico menos 6 días*. Los ficheros son:
- `casos.coruna.csv`. Casos para la provincia de A Coruña.
- `casos.lugo.csv`. Casos para la provincia de Lugo.
- `casos.ourense.csv`. Casos para la provincia de Ourense.
- `casos.pontevedra.csv`. Casos para la provincia de Pontevedra.

Todos estos ficheros tienen las mismas columnas y se definen de la siguiente forma (fuente: ISCIII):
- `fecha`: la fecha de inicio de síntomas o, en su defecto, la fecha de diagnóstico menos 6 días.
- `num_casos`: el número de casos totales, confirmados o probables.
- `num_casos_prueba_pcr`: el número de casos con prueba de laboratorio PCR o técnicas moleculares.
- `num_casos_prueba_test_ac`: el número de casos con prueba de laboratorio de test rápido de anticuerpos.
- `num_casos_prueba_otras`: el número de casos con otras pruebas de laboratorio, mayoritariamente por detección de antígeno o técnica Elisa.
- `num_casos_prueba_desconocida`: el número de casos sin información sobre la prueba de laboratorio.


Serie histórica de casos activos y fallecidos en centros residenciales
------------------------------------------------------------

El SERGAS reporta información sobre los *centros residenciales*, que son de dos tipos:
- *Residencias*. Residencias públicas o privadas de personas de la tercera edad.
- *Hospitales y residencias integradas*. Centros habilitados como combinación de hospital y residencia para tratar a pacientes de COVID19.

Esta serie histórica contiene casos activos y fallecidos vinculados con centros residenciales (ambos tipos) proporcionados por el SERGAS. Concretamente contiene (i) casos activos de profesionales y usuarios de centros residenciales a nivel global de Galicia, (ii) fallecidos totales en estos los dos tipos de centros residenciales y (iii) fallecidos totales de cada una de las residencias gallegas donde ha habido algún fallecimiento por COVID19.

La serie histórica comienza el 8 de Abril de 2020, cuando los informes diarios del SERGAS proporcionan información específica de los centros residenciales, indicando los nuevos fallecidos del día anterior en cada residencia. Para reconstruir la serie histórica de los fallecidos en cada residencia, se obtuvo el total de cada residencia en "El mapa y la evolución del coronavirus en Galicia" del Faro de Vigo (https://afondo.farodevigo.es/galicia/el-mapa-del-coronavirus-en-galicia.html) a día 26 de Junio de 2020 y, mediante los informes diarios del SERGAS, se fueron restando los nuevos fallecidos reportados ese día en cada residencia, hasta llegar al 8 de Abril del 2020. En este sentido, algunas residencias comienzan la serie histórica con varios fallecidos (sobre todo las que más fallecidos tuvieron).

Los ficheros son:

- `centros_residenciales.csv`. Contiene la serie histórica de casos activos y fallecimientos en centros residenciales. Las columnas son:
    - `activos.residentes`. Casos activos de usuarios residentes en centros residenciales.
    - `activos.profesionales`. Casos activos de profesionales en centros residenciales.
    - `fallecidos.residencias.acum`. Total de fallecidos en residencias.
    - `fallecidos.hospitales_residencias_integradas.acum`. Total de fallecidos en hospitales y residencias integradas.
    - `fallecidos.residencia.<localidad>.<provincia>.<nombre>.acum`. Total de fallecidos en una residencia concreta. Estas columnas son únicamente referentes a residencias, no a hospitales y residencias integradas.


Serie histórica de positivos y cierre de aulas y centros educativos
-------------------------------------------------------------------
Esta serie contiene información que la Xunta publica desde el 19 de Septiembre de
2020 acerca de los positivos y cierre de aulas/centros educativos públicos donde haya habido al menos un positivo.

El fichero es:
- `centros_educativos/centros_educativos.csv`. Contiene la serie histórica de centros educativos. Las columnas son:
    - `fecha`. Fecha de la situación.
    - `area_sanitaria`. Área sanitaria.
    - `concello`. Ayuntamiento.
    - `tipo_centro`. E.I.=Escuela Infantil, CEIP=Centro de enseñanza infantil y primaria (mayor de 4 años), CPR=Centro plurilingüe, IES=Instituto de Enseñanza Secundaria, CEEPR=Centro Educación Especial
    - `nombre_centro`. Nombre del centro.
    - `positivos`. Casos positivos SARS-CoV-2 detectados.
    - `aulas_cerradas`. Número de aulas cerradas. O "Todas" si está el centro cerrado.
    - `centro_cerrado`. Si el centro está cerrado (si/no)

Serie histórica de incidencia acumulada a 7 y 14 días por municipios
--------------------------------------------------------------------
Desde el 21/11/2020 el SERGAS proporciona el número de nuevos casos detectados por PDIA en los últimos 14 días y, a partir del 2/3/2021, también en los últimos 7 días. Para municipios pequeños aporta un intervalo de casos.

A partir del 2/3/2021, los ficheros son:
- `incidencia-municipios/[fecha]_incidencia_14d_7d_municipios.csv`. Contiene la incidencia acumulada a 14 días por municipio en la fecha `[fecha]`. Las columnas son:
    - `fecha`. Fecha de publicación del dato. Los datos se refieren a las 24h anteriores a las 18.00h del día anterior.
    - `codigo_municipio`. Código INE del municipio.
    - `municipio`. Nombre del municipio.
    - `habitantes`. Número de habitantes según el INE 2019.
    - `casos_14d`. Número de positivos por PDIA en los últimos 14 días. Valor exacto.
    - `casos_14d_min`. Número mínimo de positivos por PDIA en los últimos 14 días. Tiene valor si no hay valor en `casos_14d`.
    - `casos_14d_max`. Número máximo de positivos por PDIA en los últimos 14 días. Tiene valor si no hay valor en `casos_14d`.
    - `IA14`. Incidencia acumulada a 14 días por 100.000 habitantes. Valor exacto.
    - `IA14_min`. Incidencia mínima acumulada a 14 días por 100.000 habitantes. Tiene valor si no hay valor en `IA14`.
    - `IA14_max`. Incidencia máxima acumulada a 14 días por 100.000 habitantes. Tiene valor si no hay valor en `IA14`.
    - `casos_7d`. Número de positivos por PDIA en los últimos 7 días. Valor exacto.
    - `casos_7d_min`. Número mínimo de positivos por PDIA en los últimos 7 días. Tiene valor si no hay valor en `casos_7d`.
    - `casos_7d_max`. Número máximo de positivos por PDIA en los últimos 7 días. Tiene valor si no hay valor en `casos_7d`.
    - `IA7`. Incidencia acumulada a 7 días por 100.000 habitantes. Valor exacto.
    - `IA7_min`. Incidencia mínima acumulada a 7 días por 100.000 habitantes. Tiene valor si no hay valor en `IA7`.
    - `IA7_max`. Incidencia máxima acumulada a 7 días por 100.000 habitantes. Tiene valor si no hay valor en `IA7`.

Hasta el 1/3/2021, los ficheros son:
- `incidencia-municipios/[fecha]_incidencia_14d_municipios.csv`. Contiene la incidencia acumulada a 14 días por municipio en la fecha `[fecha]`. Las columnas son:
    - `fecha`. Fecha de publicación del dato. Los datos se refieren a las 24h anteriores a las 18.00h del día anterior.
    - `codigo_municipio`. Código INE del municipio.
    - `municipio`. Nombre del municipio.
    - `habitantes`. Número de habitantes según el INE 2019.
    - `casos_14d`. Número de positivos por PDIA en los últimos 14 días. Valor exacto.
    - `casos_14d_min`. Número mínimo de positivos por PDIA en los últimos 14 días. Tiene valor si no hay valor en `casos_14d`.
    - `casos_14d_max`. Número máximo de positivos por PDIA en los últimos 14 días. Tiene valor si no hay valor en `casos_14d`.
    - `IA14`. Incidencia acumulada a 14 días por 100.000 habitantes. Valor exacto.
    - `IA14_min`. Incidencia mínima acumulada a 14 días por 100.000 habitantes. Tiene valor si no hay valor en `IA14`.
    - `IA14_max`. Incidencia máxima acumulada a 14 días por 100.000 habitantes. Tiene valor si no hay valor en `IA14`.


