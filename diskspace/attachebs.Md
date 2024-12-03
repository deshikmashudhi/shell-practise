###attach ebs volume to running ebs instances
it is just like hard disk
the condition for ebs volume is instance and ebs volume should be in same availabulity zone
###steps
by default you cant see the volume in linux server , we need to do some configuration 
lsblk # to check the volume is available or not
sudo file -s /dev/xvdf
create file system
sudo mkfs -t xfs /dev/xvdf
sudo yum install xfsprogs #aws will be installed automtically
sudo mkdir directoryname
sudo mount /dev/xvdf/ /directoryname
check the mount point df -ht 
