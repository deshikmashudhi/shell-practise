#!/bin/bash
echo "check the disk usage in linux system"
disk_size=$(df -h|grep "/dev/xvda16" |awk '{print $5}'|cut -d '%' -f 1)
echo "$disk_size%  disk is filled"
if [ $disk_size -gt 5 ];
then
   echo "disk utilization is more than 10%,free the space"
else
   echo "enough disk is available"
fi