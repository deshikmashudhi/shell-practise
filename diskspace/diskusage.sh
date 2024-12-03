#!/bin/bash
 
# yum update -y --exclude=kernel*
# yum -y install postfix cyrus-sasl-plain mailx
# systemctl restart postfix
# systemctl enable postfix
# vi /etc/posttfix/main.cf
# append these comamnds inot the file
# relayhost = [smtp.gmail.com]:587
# smtp_use_tls = yes
# smtp_sasl_auth_enable = yes
# smtp_sasl_password_maps = hsh:etc/postfix/sasl_passwd
# smtp_sasl_security_options = noanonymous
# smtp_sasl_tls_security_options = noanonymous
process
#for disk usage we will check lsblk or  
#df-ht to see disk usage 
#install gmail in linux server
#create a cron tab fro every 1hr 
#algorithm 
# gmail setup using commands 
#colors
#validations
#log redirections
# df -ht | grep -v tmpfs
# -v it is used we dont need to show the result except the name which is given (verbose)
# -E we can give extra name which we dont need df -ht | grep -vE 'tmpfs|Filesystem' #it indicates i dont want the both
DATE=$(date +%F::%H:%M:%S)
R="\e[32m"
G="\e[31m"
Y="\e[33m"
N="\e[0m"

SCRIPT_NAME=$0
LOGFILE_DIR=/tmp

LOGFILE="$LOGFILE_DIR/$SCRIPT_NAME-$DATE.log"

DISK_USAGE=$(df -ht | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1 #percentage of usaage
#IFS=INTERNAL FIELD SAPERATOR
while IFS= read line 
do
    usage=$(echo $line| aws '{print $6}' | cut -d % -f1)
    #this command will give us parttiion 
    partition=$(echo $line | awk '{print $1}')
    #now we need to check weather it is thresould or not
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then
        message+="HIGH DISK USAGE ON $partition: $usage\n"
    fi

# +add to the existing message (latest message will append the previous message so we use + to add data to old and new message )
done <<< $DISK_USAGE
echo -e "message: $message"
#aws is used to cut the line and show the data 
#cut -d % -f1 meaning of this is after doing awk we will get some data and cut by using -d(delemter) what data you wan tto cut i want to cut % -f1

#send mail to the users

echo "$message" | mail -s "HIGH DISK USAGE" info@deshikdevop.com

#how to call other shell scritp from your parent script sh and script name
sh main-disk.sh info@deshik.com "HIGH DISK USAGE" "$message" "Devops team" "High disk usage"
 