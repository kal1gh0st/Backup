#!/bin/bash
####################################
#
# Backup to NFS mount script.
#
####################################

# qui setto la directory da cui parte il backup (verranno incluse tutte le sottodirectory)
Backup_Dirs="/home/kalighost"
#esempio
#backup_files="/home /var/spool/mail /etc /root /boot /opt"

# assegno la data nel formato giorno-mese-anno
Backup_Date="date +%d-%m-%Y"

# specifico il nome del file di backup - inserire la vostra NOME-DIRECTORY
#Backup_File_Name=/home/NOME-DIRECTORY/scripts/server-${Backup_Date}.tar.gz
#esempio
archive_file="$hostname-$day.tgz"

# assegno alla variabiale Precedente la data del backup diminuita di due mesi (per eliminare il backup di due mesi prima)
Precedente="$(/bin/date --date '2 month ago' +%d-%m-%Y)"

# Creo il file tar con il nome giorno-mese-anno
# Nel file excluded-files elenco tutte le eventuali directory che NON voglio inserire nel backup
pushd 
#cd $Backup_Dirs
tar -X /home/kalighost/scripts/excluded-files -cvzf ${archive_file} web
echo > "Backup finished"
# Creato il file tar mi preparo all'upload su altro server del backup
popd

# Settaggi per l'ftp
cat < < EOT > data-ftp.cmd
set confirm-close no
set progress-meter 0
set passive off
set connect-timeout 20
set control-timeout 20
set auto-resume yes
set xfer-timeout 30

# Qui devo sostituire LOGIN PASSWORD e HOST con i dati di accesso all'ftp del server remoto
open -u LOGIN -p PASSWORD HOST
binary

# Specifico in quale DIR del server remoto deve mettere il file di backup
cd backup

# Uplodo il file
put ${Backup_File_Name}

# Cancello il backup precedente con le regole assegnate prima alla variabile Precedente
delete server-${Precedente}.tar.gz
quit
EOT

# Lancio l'ftp verso il server remoto con i comandi appena scritti in data-ftp.cmd
ncftp < data-ftp.cmd

# Cancello il file di backup sul server di origine
rm ${Backup_File_Name}