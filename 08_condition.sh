#!/bin/bash
D=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOG_PATH=/home/ec2-user/shell/logs
LOGFILE=$LOG_PATH/$SCRIPT_NAME-log
u=$(id -u)
if [ $u -ne 0 ]
then
echo " Please run the script with root or superuser previliges "
exit 1
fi
yum install git -y &>> $LOGFILE