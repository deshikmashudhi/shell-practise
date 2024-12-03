#!/bin/bash
#Author: deshik
#installing multiple packages

#!/bin/bash
# Author: Deshik
# Installing multiple packages

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

# Loop through each software passed as argument
for software in "$@"
do
   # Check if the software is already installed
   if which $software > /dev/null
   then
       echo "$software is already installed."
   else
       echo "Installing software $software..."
       sudo apt install $software -y &> /tmp/$software-install.log

       # Check if installation was successful
       if [ $? -eq 0 ]; then
           echo "Successfully installed $software."
       else
           echo "Failed to install $software. Check the log file /tmp/$software-install.log for details."
       fi
   fi
done
