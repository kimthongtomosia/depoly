#!/bin/bash

branch_name="main"

LOGFILE="/home/thong-le/Documents/deploy.log"
MAX_RETRIES=3
RETRY_COUNT=0

while [ ! -f "$LOGFILE" ]; do
    echo "$(date) - File khong ton tai. Thu lai lan $((RETRY_COUNT+1))..."
    RETRY_COUNT=$((RETRY_COUNT+1))
    if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
        echo "$(date) - Khong the thuc hien deploy. Ket thuc chuong trinh."
        exit 1
    fi
    sleep 5
done
echo "$(date) - File $LOGFILE ton tai."



BACKUP_DIR="/home/thong-le/Documents/deploy_backup_$(date +"%Y%m%d_%H%M%S")"
cp -r "$LOGFOLDER" "$BACKUP_DIR"
if [ $? -eq 0 ]; then
    echo "$(date) - Backup folder $LOGFOLDER to $BACKUP_DIR tao thanh cong."
else
    echo "$(date) - Backup folder $LOGFOLDER khong thanh cong."
fi