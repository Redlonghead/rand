#!/bin/bash

echo -e "What directory do you want to back up? ->\c"
read ans 


echo "Performing backup..."
sleep 3
file=$(echo $ans | sed s#/#-#g)
date=$(date +%F)
tar -zcvf ~/backup-$file-$date.tar.gz $ans

echo "Backup completed successfully to ~/backup-$file-$date.tar.gz"