#!/bin/bash
#create user and give sudo access and validate it using functions
commands in linux is user add 

R="\e[31m"
G="\e[32m"
N="\e[0m"

read -p "enter the username to check: " $USERNAME 
  
if grep -q "^$USERNAME:" /etc/passwd;  #proceed -q quietly to check ^ ensure that available in starting
then
    echo -e  "$G user $USERNAME exists $N"
else
    echo -e "$G user $USERNAME does not exists $N"

fi