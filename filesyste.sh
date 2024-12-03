#!/bin/#!/bin/bash
echo "this program get first 10 biggest in tthe file system passed via possitional argumnets"
path="$1"
echo $path
du -ah $path | sort -hr | head -n 5 > /tmp/filesize.txt
echo "this is the list of big files in the file system $path"
cat /tmp/filesize.txt