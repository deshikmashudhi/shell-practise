#!/bin/bash
echo "this script to delete the old files which or older than 30 days"
path=$1
echo $path
find $path -mtime +30 -delete
if [ $? -eq 0 ];
then
  echo "Files are deleted successfull"
else
  echo "there is no older file more than 30 days"
fi