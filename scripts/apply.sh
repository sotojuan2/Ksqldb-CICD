#!/bin/bash


echo "Ini apply"
DIR=`pwd`
echo "el directorio ${DIR}"
OUTPUT=`ksql-migrations -c ksql-migrations.properties apply -a --dry-run`
echo "${OUTPUT}" | grep -q Successfully
if [ $? -eq 0 ] ; then echo "UNIT TEST DONE  ${OUTPUT}" ; 
else  echo "UNIT TEST fail -  ${OUTPUT}" 
        exit 1 ; 
fi
echo "TEST DONE"
exit 0