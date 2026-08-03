#!/bin/sh

#found on stackoverflow about keeping env in docker crontab
printenv | grep -iv "^no_proxy=" >> /etc/environment
exec cron -f