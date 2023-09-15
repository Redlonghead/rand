#!/bin/bash

echo "Performing backup..."

date=$(date +%F)
tar -zcvf /iscsi/backup/backup-home-$date.tar.gz /mnt/sdb/home/

echo "Backup done"