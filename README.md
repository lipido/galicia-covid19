Datos COVID-19 Galicia
======================

Este repositorio contiene datos del COVID-19 para la Comunidad Autónoma de Galicia. Las fuentes son:
- Consellería de Sanidade (Xunta de Galicia). Proporciona datos a nivel global de la Comunidad Autónoma de Galicia y únicamente de casos activos por Área Sanitaria.
- Xerencia da Área Sanitaria de Ourense, Verín e O Barco de Valdeorras (SERGAS). Proporciona datos de detallados de Ourense y del resto de Áreas Sanitarias.
- Instituto de Salud Carlos III. Proporciona la serie de casos confirmados por PCR por fecha de inicio de síntomas a nivel provincial.

Ficheros
--------

- `galicia.csv`. Serie histórica básica de Galicia (casos totales, activos, altas y fallecimientos). Las columnas son:
    - `Galicia.casos.acum`: Casos totales hasta la fecha. La Consellería de Sanidade publica los casos activos y no los casos totales como tal. Esta columna es la resultante de sumarle los fallecidos y las altas al dato de activos de la Consellería. Por tanto, los casos activos serían `Galicia.casos.acum` - `Galicia.altas.acum` - `Galicia.fallecidos.acum`.
    - `Galicia.altas.acum`: Altas totales hasta la fecha.
    - `Galicia.fallecidos.acum`: Fallecidos totales hasta la fecha.
- `ourense.csv`. Serie histórica básica del área sanitaria de Ourense, Verín e O Barco de Valdeorras. Las columnas son:
    - `Ourense.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `Ourense.altas.acum`: Altas totales hasta la fecha. 
    - `Ourense.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `ourense.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Ourense, Verín e O Barco de Valdeorras. Las columnas son:
    - `Ourense.domicilio`: Casos activos con seguimiento a domicilio.
    - `Ourense.hospitalizados_HPCHUO`: Hospitalizados totales (UCI + planta) en el hospital CHUO (Complexo Hospitalario Universitario de Ourense) (público).
    - `Ourense.hospitalizados_Carmen`: Hospitalizados totales (UCI + planta) en la clínica El Carmen (privado).
    - `Ourense.hospitalizados_COSAGA`: Hospitalizados totales (UCI + planta) en la clínica el hospital CO.SA.GA (privado).
    - `Ourense.hospitalizados_HPValdeorras`: Hospitalizados totales (UCI + planta) en la clínica el hospital de O Barco de Valdeorras (público).
    - `Ourense.hospitalizados_HPVerin`: Hospitalizados totales (UCI + planta) en el hospital de Verín (público).
    - `Ourense.uci_HPCHUO`: Pacientes en UCI en el hospital CHUO (Complexo Hospitalario Universitario de Ourense) (público).
    - `Ourense.uci_COSAGA`: Pacientes en UCI en la clínica el hospital CO.SA.GA (privado).
    - `Ourense.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en Ourense. Algunas pruebas PCR a pacientes de Ourense se hicieron en Vigo y no están contabilizadas aquí.
- `lugo.csv`. Serie histórica básica del área sanitaria de Lugo, Cervo e Monforte de Lemos. Las columnas son:
    - `lugo.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `lugo.altas.acum`: Altas totales hasta la fecha. 
    - `lugo.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `lugo.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Lugo, Cervo e Monforte de Lemos. Las columnas son. Las columnas son:
    - `Lugo.domicilio`: Casos activos con seguimiento a domicilio.
    - `Lugo.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `Lugo.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `Lugo.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.
- `vigo.csv`. Serie histórica básica del área sanitaria de Vigo. Las columnas son:
    - `vigo.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `vigo.altas.acum`: Altas totales hasta la fecha. 
    - `vigo.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `vigo.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Vigo. Las columnas son. Las columnas son:
    - `vigo.domicilio`: Casos activos con seguimiento a domicilio.
    - `vigo.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `vigo.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `vigo.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.
- `pontevedra.csv`. Serie histórica básica del área sanitaria de Pontevedra e O Salnés. Las columnas son:
    - `pontevedra.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `pontevedra.altas.acum`: Altas totales hasta la fecha. 
    - `pontevedra.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `pontevedra.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Pontevedra e O Salnés. Las columnas son. Las columnas son:
    - `pontevedra.domicilio`: Casos activos con seguimiento a domicilio.
    - `pontevedra.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `pontevedra.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `pontevedra.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.

- `santiago.csv`. Serie histórica básica del área sanitaria de Santiago de Compostela. Las columnas son:
    - `santiago.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `santiago.altas.acum`: Altas totales hasta la fecha. 
    - `santiago.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `santiago.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Santiago de Compostela. Las columnas son. Las columnas son:
    - `santiago.domicilio`: Casos activos con seguimiento a domicilio.
    - `santiago.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `santiago.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `santiago.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.
- `coruna.csv`. Serie histórica básica del área sanitaria de A Coruña. Las columnas son:
    - `coruna.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `coruna.altas.acum`: Altas totales hasta la fecha. 
    - `coruna.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `coruna.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de A Coruña. Las columnas son. Las columnas son:
    - `coruna.domicilio`: Casos activos con seguimiento a domicilio.
    - `coruna.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `coruna.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `coruna.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.
- `ferrol.csv`. Serie histórica básica del área sanitaria de Ferrol. Las columnas son:
    - `ferrol.casos.acum`: Casos totales hasta la fecha. Los casos son con PCR positiva a partir del 25 de mayo con total seguridad. Antes de esta fecha se incluían casos diagnosticados clínicamente con posterior test positivo de anticuerpos. Podrían ser unos 200 casos y concentrados al principio de la serie.
    - `ferrol.altas.acum`: Altas totales hasta la fecha. 
    - `ferrol.fallecidos.acum`: Fallecidos totales hasta la fecha. Hasta el 8 de abril no se inluían fallecidos en residencias.
- `ferrol.ext.csv`. Serie histórica con datos extendidos para el área sanitaria de Ferrol. Las columnas son. Las columnas son:
    - `ferrol.domicilio`: Casos activos con seguimiento a domicilio.
    - `ferrol.hospitalizados`: Hospitalizados totales (UCI + planta) en los hospitales del Área Sanitaria.
    - `ferrol.uci`: Pacientes en UCI en los hospitales del Área Sanitaria.
    - `ferrol.PCR.acum`: Total de pruebas PCR hechas hasta la fecha en el Área Sanitaria.

Por otra parte se incluye un fichero que contiene la correspondencia entre municipios y áreas sanitarias. Las columnas son:
- `municipios-areas-csv`.
    - `municipio`.
    - `provincia`.
    - `area_sanitaria`.


### Series de casos confirmados en el ISCIII RENAVE
Estos ficheros contienen las series de casos *por fecha de inicio de síntomas o, en su defecto, de diagnóstico menos 6 días*. Los ficheros son:
- `casos.coruna.csv`. Casos para la provincia de A Coruña.
- `casos.lugo.csv`. Casos para la provincia de Lugo.
- `casos.ourense.csv`. Casos para la provincia de Ourense.
- `casos.pontevedra.csv`. Casos para la provincia de Pontevedra.

Todos estos ficheros tienen las mismas columnas y se definen de la siguiente forma (fuente: ISCIII):
- `num_casos`: el número de casos totales, confirmados o probables.
- `num_casos_prueba_pcr`: el número de casos con prueba de laboratorio PCR o técnicas moleculares.
- `num_casos_prueba_test_ac`: el número de casos con prueba de laboratorio de test rápido de anticuerpos.
- `num_casos_prueba_otras`: el número de casos con otras pruebas de laboratorio, mayoritariamente por detección de antígeno o técnica Elisa.
- `num_casos_prueba_desconocida`: el número de casos sin información sobre la prueba de laboratorio.



