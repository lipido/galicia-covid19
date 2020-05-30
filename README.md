Datos COVID-19 Galicia
======================

Este repositorio contiene datos del COVID-19 para la Comunidad Autónoma de Galicia. Las fuentes son:
- Consellería de Sanidade (Xunta de Galicia).
- Xerencia da Área Sanitaria de Ourense, Verín e O Barco de Valdeorras (SERGAS).

Ficheros
--------

- `galicia.csv`. Serie histórica básica de Galicia (casos totales, activos, altas y fallecimientos). Las columnas son:
    - `Galicia.casos.acum`: Casos totales hasta la fecha.
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
