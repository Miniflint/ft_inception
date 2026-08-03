FROM debian:bullseye

# download mariadb-backup and cron 
RUN apt update -y && apt upgrade -y && apt install -y mariadb-backup cron && \
    rm -rf /var/lib/apt/lists/* && mkdir -p /backup

# copy necessary files (backup, cron, and env saving)
COPY ./tools/backup_file.sh /backup_file.sh
COPY ./tools/crontab /etc/cron.d/backupFile
COPY ./tools/entrypoint.sh /entrypoint.sh

# apply executable and rights
RUN chmod +x /backup_file.sh && chmod 644 /etc/cron.d/backupFile && chmod +x /entrypoint.sh

# start the crontab job
RUN crontab /etc/cron.d/backupFile

CMD [ "/entrypoint.sh" ]