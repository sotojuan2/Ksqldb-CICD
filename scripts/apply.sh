#!/bin/bash

if [ "$#" -eq 0 ]
then
  echo "No arguments supplied"
  exit 1
fi

if [[ "$1" != "dry" && "$1" != "apply" ]]; then
  echo "Invalid parameter. Usage: script.sh [dry/apply]"
  exit 1
fi

echo "Ini apply"
if [ "$1" = "dry" ]; then
  echo "Executing dry run command..."
  OUTPUT=`ksql-migrations -c ksql-migrations.properties apply -a --dry-run`
  # insert dry run command here
else
  echo "Executing apply command..."
  OUTPUT=`ksql-migrations -c ksql-migrations.properties apply -a`
  # insert apply command here
fi

DIR=`pwd`
echo "el directorio ${DIR}"
OUTPUT=`ksql-migrations -c ksql-migrations.properties apply -a --dry-run`
#echo "${OUTPUT}" | grep -q Successfully
echo "${OUTPUT}" | grep -q 'No eligible migrations found\|Failed to verify'
if [ $? -eq 0 ] ; 
    then echo "ERROR  ${OUTPUT}" 
    exit 1; 
else  echo "UNIT TEST fail -  ${OUTPUT}" 
        exit 0 ; 
fi
echo "TEST DONE"
exit 0