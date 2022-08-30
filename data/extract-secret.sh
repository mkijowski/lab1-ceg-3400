#!/bin/bash

TMPF=/tmp/secrets-removed.csv

cat $1 | cut -d "," -f3- > $TMPF


awk -F "," '{print $1}' $TMPF | cut -c 1 > finit
awk -F "," '{print $2}' $TMPF > lname

cat -n finit > finitnl && rm finit
cat -n lname > lnamenl && rm lname

join --nocheck-order finitnl lnamenl > secret && rm finitnl lnamenl

awk '{print $2$3","}' secret > secrets && rm secret

cat -n secrets > finitlnamenl && rm secrets
cat $TMPF | cut -d "," -f3- > datascrub
cat -n datascrub > datascrubnl && rm datascrub

join --nocheck-order finitlnamenl datascrubnl > shiny.csv
cat shiny.csv | sed 's/^[0-9]\+[[:blank:]]//g' > reallyshiny.csv && rm shiny.csv

rm $TMPF finitlnamenl datascrubnl

