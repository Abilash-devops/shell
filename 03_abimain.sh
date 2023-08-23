#!/bin/bash
d=$(date +%F)
LOGPATH=/home/centos/shell/logs
SCRIPT_NAME=$0
LOGFILE=$LOGPATH/$0-$d-log
u=$(id -u)
if [ $u -ne 0 ]
then
    echo " Bro you dont have acess with this user Please try as root or sudo acess"
    exit 1
fi
yum install git -y &>>$LOGFILE

if [ $? -ne 0 ]
then 
    echo " git installation is failure"
else
    echo " git installtion is success"
fi

