#!/bin/bash
####################################
#
# Backup to NFS mount script. Fedele
#
####################################
#typically the first line of the bash scripts
#BACKUPTIME=`date +%b-%d-%y` #get the current date
BACKUPTIME='date +%b-%d-%y'
DESTINATION='/home/kalighost/backup/backup-$BACKUPTIME.tar.gz' #create a backup file using the current date in it's name
SOURCEFOLDER='/home/kalighost/' #the folder that contains the files that we want to backup
tar -cpzf $DESTINATION $SOURCEFOLDER #create the backup
ls -lah /home/kalighost/backup/backup-$BACKUPTIME.tar.gz