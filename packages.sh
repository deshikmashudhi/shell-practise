#!/bin/bash
#Author: deshik
#installing multiple packages

if [ $# -eq 0 ]
then
  echo "Usage: please provide software names as command line"
  exit 1
fi

if [ $(id -u) -ne 0 ]
then 
   echo "please run from the root use or wih sudo access"
   exit 2
fi

for softwares in $@
do
   if which $doftwares $> /dev/null
   then
       echo "Already $softwares is installed"
   else
       echo "installing software $softwares....."
       sudo apt install $softwares -y &> /dev/null
       if [ $? -ne 0 ];
       then
           echo "succesfully installed $softwares packages" 
       else
           echo "unable to install $software packages"
        fi
    fi
done