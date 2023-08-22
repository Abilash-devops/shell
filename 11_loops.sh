#!/bin/bash
D=$(date)
SCRIPT_NAME=$0
LOG_PATH=/home/centos/shell/logs
LOGFILE=$LOG_PATH/$D-$SCRIPT_NAME-log
u=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
if [ $u -ne 0 ]
then
echo " Please run the script with root or superuser previliges "
exit 1
fi
validate(){
    if [ $? -ne 0 ]
    then 
        echo -e " $2 is $R FAILURE $N"
        exit 1
    else
        echo -e " $2 is $G SUCCESS $N"
        y=$(yum list installed $i)
        echo "Displaying the output :$y"
    fi
}
for i in $@ 
do 
yum list installed $i &>> $LOGFILE
    if [ $? -ne 0 ]
    then
    echo " $i package is not installed, Lets install it "
    yum install $i -y &>> $LOGFILE
    validate $? "$i" 
    else
    echo -e " $i is $Y ALREADY INSTALLED $N"
    fi
done

