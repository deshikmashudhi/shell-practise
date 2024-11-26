#!/bin/bash

#write a file to check the user is having sudo access or not
#linux command is id -u
R="\e[31m" 
G="\e[32m" 
N="\e[0m" 

if [ "$(id-u)" -eq 0 ]
then
    echo -e "$G you have root access"
else
    echo -e "$R you dont have root access"
fi
