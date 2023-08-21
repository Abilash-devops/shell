#!/bin/bash
u=$(id -u)
if [ $u -ne 0 ]
then
echo " Please run the script with root or superuser previliges "
exit 1
fi
yum install git -y