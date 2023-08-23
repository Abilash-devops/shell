#!/bin/bash
d=$(date +%F:%H:%M:%S)
LOGPATH=/home/centos/shell/logs
SCRIPT_NAME=$0
LOGFILE=$LOGPATH/$0-$d-log
u=$(id -u)
if [ $u -ne 0 ]
then
    echo " Bro you dont have acess with this user Please try as root or sudo acess"
    exit 1
fi

abi(){

    if [ $? -ne 0 ]
    then 
        echo " $2 installation is failure"
    else
        echo " $2 installtion is success"
    fi
}

yum install git -y &>>$LOGFILE

abi $? "git"

yum install nginx -y &>>$LOGFILE

abi $? "nginx"



