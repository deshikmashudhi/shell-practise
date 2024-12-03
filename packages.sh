#!/bin/bash
#Author: deshik
#installing multiple packages


# Check if at least one argument (software name) is provided
if [ $# -eq 0 ]
then
  echo "Usage: please provide software names as command line arguments"
  exit 1
fi

# Check if the script is being run as root or with sudo access
if [ $(id -u) -ne 0 ]
then
   echo "Please run this script as root or with sudo access"
   exit 2
fi

# Log directory setup
LOGDIR="/home/centos/shellscript-logs"
if [ ! -d "$LOGDIR" ]; then
  echo "Log directory $LOGDIR does not exist. Creating it..."
  mkdir -p "$LOGDIR"
fi

# Get current date
DATE=$(date +%F)

# Loop through each software passed as argument
for software in "$@"
do
   # Check if the software is already installed
   if which $software > /dev/null
   then
       echo "$software is already installed."
   else
       echo "Installing software $software..."
       sudo apt install $software -y &> "$LOGDIR/$software-$DATE.log"

       # Check if installation was successful
       if [ $? -eq 0 ]; then
           echo "Successfully installed $software."
       else
           echo "Failed to install $software. Check the log file $LOGDIR/$software-$DATE.log for details."
       fi
   fi
done
