#!/bin/bash
echo "will try to get today is holiday or not"
read n
if [ $n -ne sunday ]
then 
echo "Go to school buddy"
else
echo "Today is holiday"
fi
