#!/bin/bash

currDate=`date +%F_%H-%M`
backupPath="/backup"
fileName="${backupPath}/wordpress_db_${currDate}.bkp"

echo "${MYSQL_USER}"
echo "${MYSQL_PASSWORD}"

mariadb-backup --backup --host=mariadb --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --target-dir=${fileName}

if [ $? -eq 0 ]; then
    echo "[OK] ${currDate}: Backup Successful | ${rtn}"
else
    echo "[NOK] ${currDate}: Backup Failed. trying again in 1 hour | ${rtn}"
    exit 1
fi
