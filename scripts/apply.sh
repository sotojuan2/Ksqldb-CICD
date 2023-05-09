#!/bin/bash


echo "Ini apply"
DIR=`pwd`
echo "el directorio ${DIR}"
OUTPUT=`ksql-migrations -c ksql-migrations.properties apply -a --dry-run`
#echo "${OUTPUT}" | grep -q Successfully
echo "${OUTPUT}" | grep -q 'No eligible migrations found\|pattern2'
if [ $? -eq 0 ] ; 
    then echo "ERROR  ${OUTPUT}" 
    exit 1; 
else  echo "UNIT TEST fail -  ${OUTPUT}" 
        exit 0 ; 
fi
echo "TEST DONE"
exit 0