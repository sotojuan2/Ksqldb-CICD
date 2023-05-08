#!/bin/bash


echo "Ini apply"
ksql-migrations -c ../ksql-migrations.properties applay -a | grep -q Successfully
if [ $? -eq 0 ] ; then echo "UNIT TEST DONE" ; else  echo "UNIT TEST fail" exit 1 ; fi
echo "TEST DONE"
exit 0