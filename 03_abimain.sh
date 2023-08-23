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
        echo -e " $i installation is $R FAILURE $N"
    else
        echo -e " $i installtion is $G SUCCESS $N"
    fi
    y=$(yum list installed $i) &>> $LOGFILE
    echo "Installed version is:$y"
}

for i in $@ 
do 
yum list installed $i &>> $LOGFILE
    if [ $? -ne 0 ]
    then
    echo " $i package is not installed, Lets install it "
    yum install $i -y &>> $LOGFILE
    abi $? "$i" 
    else
    echo -e " $i is $Y ALREADY INSTALLED $N"
    fi
done



