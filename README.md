# Backup
Bash backup
this repository is made up of various scripts in bash
to make large and small local and remote backups.


This article we bring shell scripts to backup your files and directories from you local Linux machine to a remote Linux server using rsync command. This would be an interactive way to perform backup, where you need to provide remote backup server hostname/ip address and folder location. We keep a separate file where you need to provide files and directories that need backup. We have added two scripts where first script ask password after each file had been copied (if you have enabled ssh authentication keys , then password will be not be asked) and in second script password will be prompted only once.

We are going to backup bckup.txt, dataconfig.txt, docs and oracledb.

[root@Fedora21 tmp]# ls -l
total 12
-rw-r--r--. 1 root root 0 May 15 10:43 bckrsync.sh
-rw-r--r--. 1 root root 0 May 15 10:44 bckup.txt
-rw-r--r--. 1 root root 0 May 15 10:46 dataconfig.txt
drwxr-xr-x. 2 root root 4096 May 15 10:45 docs
drwxr-xr-x. 2 root root 4096 May 15 10:44 oracledb

This file contains backup files / dir details

[root@Fedora21 tmp]# cat /tmp/bckup.txt
/tmp/oracledb
/tmp/dataconfig.txt
/tmp/docs
[root@Fedora21 tmp]#

Running the script with output

[root@Fedora21 tmp]# ./bckrsync.sh
Shell Script Backup Your Files / Directories Using rsync
Destination backup Server : 104.*.*.41
Destination Folder : /tmp
Copying /tmp/oracledb ...
The authenticity of host '104.*.*.41 (104.*.*.41)' can't be established.
ECDSA key fingerprint is 96:11:61:17:7f:fa:......
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '104.*.*.41' (ECDSA) to the list of known hosts.
root@104.*.*.41's password:
DONE
Copying /tmp/dataconfig.txt ...
root@104.*.*.41's password:
DONE
Copying /tmp/docs ...
root@104.*.*.41's password:
DONE
[root@Fedora21 tmp]#
