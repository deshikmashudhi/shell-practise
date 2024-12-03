#!/bin/bash
#delete logfile more than 2 weeks
#go to log folder
#check every date and assume that how many files are more than two weeks list all those and delete those files with .log extention
#create old date files with touch -d "2023-08-01".log
#      folder filename all.log  f(file) 14days before
#find /var/log -name "*.log" -type f -mtime +14

DATE=$(date +%F:%H:%M:%S)
APP_LOGS_DIR=/home/centos/app-logs
#our intention is to give in logs is 
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

#to find filee 

FILES_TO_DELETE=$(find /var/log -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>> $LOGFILE  

#to do porcess one by one we should use while loop
#reading lines of the inputy
while read line
do 
    echo "Deleing $line" &>> $LOGFILE 
    rm -rf $line
done <<< $FILES_TO_DELETE #text input we should give three less than symbols.

#schedule this file everyday like crontab
# * * * * /home/centos/shell-practice/deletelogs.sh

# 0 0 * * * /bin/bash /home/centos/shell-practice/deletelogs.sh >> /home/centos/app-logs/deletelogs-cron.log 2>&1
#!/bin/bash

# Get the current date in the desired format (Year-Month-Day:Hour:Minute:Second)
DATE=$(date +%F:%H:%M:%S)

# Log directory where logs will be stored
APP_LOGS_DIR=/home/centos/app-logs

# Log file where script logs will be saved (with the script name and date)
SCRIPT_NAME=$(basename "$0")  # This gets just the script name
LOGFILE="$APP_LOGS_DIR/$SCRIPT_NAME-$DATE.log"

# Find files older than 14 days and store them in the FILES_TO_DELETE variable
FILES_TO_DELETE=$(find /var/log -name "*.log" -type f -mtime +14)

# Start logging the execution time of the script
echo "Script started executing at $DATE" &>> "$LOGFILE"

# Process each file to delete one by one
while read -r line
do
    # Log the file being deleted
    echo "Deleting $line" &>> "$LOGFILE"
    # Remove the file
    rm -rf "$line"
done <<< "$FILES_TO_DELETE"  # Provide the list of files to delete as input

# End of the script