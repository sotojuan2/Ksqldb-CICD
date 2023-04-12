#!/bin/bash

# Ruta del directorio a analizar
ruta_directorio="migrations/"
ruta_tests="unit_tests/"

# Obtener la lista de archivos en el directorio
archivos=$(ls "$ruta_directorio" | sed -e 's/\.sql$//')


# Iterar sobre cada archivo en la lista y obtener las estadísticas
for archivo in $archivos
do
    echo "UNIT TEST de $archivo:"
    archivoSQL="${ruta_tests}${archivo}.sql"
    archivoEntrada="${ruta_tests}${archivo}_input.sql"
    archivoSalida="${ruta_tests}${archivo}_output.sql"
    if test -f "$archivoSQL"; then
        echo "$archivoSQL exists."
    else
        echo "$archivoSQL NO exists."
        #SALIR CON ERROR
        exit 1
    fi
    if test -f "$archivoEntrada"; then
        echo "$archivoEntrada exists."
    else
        echo "$archivoEntrada NO exists."
        #SALIR CON ERROR
        exit 1
    fi
    if test -f "$archivoSalida"; then
        echo "$archivoSalida exists."
    else
        echo "$archivoSalida NO exists."
        #SALIR CON ERROR
        exit 1
    fi

    #echo "nombre de $archivoEntrada"
    #echo "nombre de $archivoSalida"
    if ksql-test-runner --input-file ${archivoEntrada} --sql-file ${archivoSQL} --output-file  ${archivoSalida} | grep -q passed; then exit 0 ; else exit 1 ; fi
    
done