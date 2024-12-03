#!/bin/bash
echo "this is my shell script: $0"

if [ $# -eq 0 ];
then
   echo "please pass one qrgument"
   exit 1
fi
echo "this is first argument passed to my script: $1"
echo "this is second argument passed to my script: $2"
echo "this is third argument passed to my script: $3"


