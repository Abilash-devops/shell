#!/bin/bash
D=$(date +%F)
SCRIPT_NAME=$0
LOG_PATH=/home/ec2-user/shell/logs
LOGFILE=$LOG_PATH/$D-$SCRIPT_NAME-log
u=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
    if [ $? -ne 0 ]
    then 
        echo -e " $2 is $R FAILURE $N"
        exit 1
    else
        echo -e " $2 is $G SUCCESS $N"
    fi
}
if [ $u -ne 0 ]
then
echo " Please run the script with root or superuser previliges "
exit 1
fi
yum install git -y &>> $LOGFILE
validate $? "Git installation"
yum install mysql -y &>> $LOGFILE
validate $? "MySQL installation"
amazon-linux-extras install nginx1 -y &>> $LOGFILE
validate $? "Nginx installation"

