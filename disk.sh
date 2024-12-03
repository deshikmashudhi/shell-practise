#!/bin/bash
echo "check the disk usage in linux system"
disk_size=$(df -h|grep "/dev/xvda16" |awk '{print $5}'|cut -d '%' -f 1)
echo "$disk_size%  disk is full"
if [ $disk_size -gt 10 ];
then
   echo "disk utilization is more than 10% free the space"
   exit 1

fi