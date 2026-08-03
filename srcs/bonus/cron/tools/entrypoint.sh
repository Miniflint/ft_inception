#!/bin/sh
printenv | grep -iv "^no_proxy=" >> /etc/environment
exec cron -f