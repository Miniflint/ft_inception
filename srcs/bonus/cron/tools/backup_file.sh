#!/bin/bash

#setup variables
currDate=`date +%F_%H-%M`
backupPath="/backup"
fileName="${backupPath}/wordpress_db_${currDate}.bkp"

#do the backup
mariadb-backup --backup --host=mariadb --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --target-dir=${fileName}

#check if ok or not for log file
if [ $? -eq 0 ]; then
    echo "[OK] ${currDate}: Backup Successful | ${rtn}"
else
    echo "[NOK] ${currDate}: Backup Failed. trying again in 1 hour | ${rtn}"
    exit 1
fi
