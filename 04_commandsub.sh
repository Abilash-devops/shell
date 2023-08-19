#!/bin/bash
LOGFILE=/root/shell/logs
SCRIPT_NAME=$0
LOGPATH=$LOGFILE/$SCRIPT_NAME-log
echo "what is the date"
echo "wanted to know date in the number format"
d=$(date +%F:%H:%M:%S)
echo "**************Today's date****************"
echo " Todays date is : $d" &>> $LOGPATH
echo "******************************************"
