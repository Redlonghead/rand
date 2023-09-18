#!/bin/bash

filename='hostname'
echo "Disk report saved to $filename.report"

echo -e "\n LVM Configuration: \n\n" >>$filename.report
lvscan >>$filename.report

echo -e "\n\n Partition Configuration: \n\n" >>$filename.report
fdisk -l | head -17 >>$filename.report

echo -e "\n\n Mounted Filesystems: \n\n" >>$filename.report
df -hT | grep -v tmp >>$filename.report