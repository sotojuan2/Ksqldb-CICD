#!/bin/bash


echo "Ini apply"
OUTPUT="$(ksql-migrations -c ../ksql-migrations.properties applay -a)"
echo "${OUTPUT}" | grep -q Successfully
if [ $? -eq 0 ] ; then echo "UNIT TEST DONE" ; else  echo "UNIT TEST fail - " ${OUTPUT} exit 1 ; fi
echo "TEST DONE"
exit 0