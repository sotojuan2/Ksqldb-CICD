#!/bin/bash



ksql-migrations -c ../ksql-migrations.properties applay -a | grep -q Successfully
if [ $? -eq 0 ] ; then echo "UNIT TEST DONE" ; else exit 1 ; fi
echo "TEST DONE"
exit 0