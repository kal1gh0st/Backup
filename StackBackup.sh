#!/bin/bash
#if [ ! -d BACKUP ]; 
#then
#    mkdir BACKUP;
#fi
#for x in *. *~ ; do
#    if [ $x -eq BACKUP.* ]; 
#    then
#        echo "Error, file BACKUP exist";
#    else
#        cp ./$x ./BACKUP;
#    fi
#done

#!/bin/bash

BACKUP=./BACKUP

if [[ -e "$BACKUP" ]]; then
    echo "$BACKUP already exists!" >&2 
    exit 1
fi

mkdir "$BACKUP"
find . -maxdepth 1 -type f -name "*~" -exec cp {} "$BACKUP" \;