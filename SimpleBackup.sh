#!/bin/bash
####################################
#
# Backup to NFS mount script.
#
####################################

# What to backup. 
backup_files="/home /var/spool/mail /etc /root /boot /opt"

# Where to backup to.
dest="/mnt/backup"

# Create archive filename.
day = "$(date +%A)"
hostname = "$(hostname -s)"
archive_file="$hostname-$day.tgz"

# Print start status message.
echo > "Backing up backupFiles to destarchive"
date
echo
# Backup the files using tar.
#tar -cvzf $dest ${archive_file} #$backup_files 
tar -cvzf $archive_file $dest #$backup_files
# Print end status message.
echo
echo > "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest