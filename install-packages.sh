#!/bin/bash
# algorithm things to do
# install mmultiple script to install packages
# user will pass the packaeges thorugh command line
# user should have root acces
# while installing store logs
# before installing it is always to check whehter package is already installed or not 
# if skip otherwise proceed for installtion
# check successfully installed or not
# implement some colours.
R="\e[32m"
G="\e[31m"
Y="\e[33m"
N="\e[0m"

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
#our intention is to give in logs is 
# /home/centos/shellscript-logs/script-name-date.log
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log #to get logs regarding the format
SCRIPT_NAME=$0
USERID=$(id -u)
if [ $USERID -ne 0 ];
then
   echo -e "$R Error: please user root access $N"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
      echo -e "installing $2..$R faailure $N"
      exit 1
    else
       echo -e "Installling $2..$G success $N"
    fi
     
}

for i in $@
do 
   apt list installed $i &>>$LOGFILE 
   if [ $? -ne 0 ]
   then
       echo "$i is not installed lets install"
       apt install $i -y &>>$LOGFILE
       VALIDATE $? "$i"
   else
       echo -e "$Y $i is already installed"
   fi
done


