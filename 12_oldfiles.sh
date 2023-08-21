#!/bin/bash
D=$(date +%F:%H:%M:%S)
APPLOG=/home/centos/shell/applogs
LOGPATH=/home/centos/shell/logs
SCRIPT_NAME=$0
LOGFILE=$LOGPATH/$SCRIPT_NAME-$D-log
today=$(date +%d-%m-%Y)
echo "Todays date is :$today"
# Find all files older than 14 days
find /home/centos/shell/applogs -mtime +14 -type f -exec ls -lh {} \; &>> $LOGFILE
# Confirm that you want to delete the files
read -p "Are you sure you want to delete these files? (y/N) " response
if [[ "$response" = "y" ]]; then
  # Delete the files
  find /home/centos/shell/applogs -mtime +14 -type f -exec rm {} \; &>> $LOGFILE
fi