#!/bin/bash
#print if the number is greater than 10 or not
NUMBER=$1
R="\e[31m" red colour
G="\e[32m" green colour
N="\e[0m" normal colour
if [ $NUMBER -gt 10 ]  #gt is greater than number
then
  echo -e "$G $NUMBER  $N is greater than 10"
else
   echo -e "$R $NUMBER $N is not greater than 10"
fi
