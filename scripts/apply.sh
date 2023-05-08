#!/bin/bash


echo "Ini apply"
DIR=`pwd`
echo "el directorio ${DIR}"
OUTPUT=`ksql-migrations -c ksql-migrations.properties applay -a`
ksql-migrations -c ksql-migrations.properties apply -a | grep -q Successfully
if [ $? -eq 0 ] ; then echo "UNIT TEST DONE" ; 
else  echo "UNIT TEST fail - " ${OUTPUT} 
        exit 1 ; 
fi
echo "TEST DONE"
exit 0