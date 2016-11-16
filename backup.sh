#!/bin/bash


DATE=$(date -u "+%F-%H%M%S")
FILE_NAME="backup-$DATE"
ARCHIVE_NAME="$FILE_NAME.tar.gz"

mongodump --host mongo:27017 --out /backup/$FILE_NAME


# Tar Gzip the file
tar -zcvf backup/$ARCHIVE_NAME backup/$FILE_NAME/

# Remove the backup directory
rm -r /backup/$FILE_NAME


