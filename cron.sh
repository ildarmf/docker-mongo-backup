#!/usr/bin/env bash

echo "(cd /backup && s3cmd --delete-removed sync . s3://af-mongo/${NAMEBASE}/)  >>/var/log/cron.log 2>&1" > /start.sh
cron -f
