#!/bin/bash
d=$(date +%F:%H:%M:%S)
LOGPATH=/home/centos/shell/logs
SCRIPT_NAME=$0
LOGFILE=$LOGPATH/$0-$d-log
u=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
if [ $u -ne 0 ]
then
    echo " Bro you dont have acess with this user Please try as root or sudo acess"
    exit 1
fi

abi(){

    if [ $? -ne 0 ]
    then 
        echo -e " $2 installation is $R FAILURE $N"
    else
        echo -e " $2 installtion is $G SUCCESS $N"
    fi
}

yum install gitt -y &>>$LOGFILE

abi $? "git"

yum install ngiinx -y &>>$LOGFILE

abi $? "nginx"



