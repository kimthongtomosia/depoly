#!/bin/bash

branch_name="main"
# environment="2.2"
# echo "Deploying $branch_name phiên bản $environment"

# LOGFILE="/home/thong-le/Documents/deploy.log"
# LOGFOLDER="/home/thong-le/Documents/shell-sscript"
# MAX_RETRIES=3
# RETRY_COUNT=0

# while [ ! -f "$LOGFILE" ]; do
#     echo "$(date) - File khong ton tai. Thu lai lan $((RETRY_COUNT+1))..."
#     RETRY_COUNT=$((RETRY_COUNT+1))
#     if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
#         echo "$(date) - Khong the thuc hien deploy. Ket thuc chuong trinh."
#         exit 1
#     fi
#     sleep 5
# done
# echo "$(date) - File $LOGFILE ton tai."



# while [ ! -d "$LOGFOLDER" ]; do
#     echo "$(date) - Thu muc khong ton tai. Thu lai lan $((RETRY_COUNT+1))..."
#     RETRY_COUNT=$((RETRY_COUNT+1))
#     if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
#         echo "$(date) - Khong the thuc hien deploy. Ket thuc chuong trinh."
#         exit 1
#     fi
#     sleep 5
# done
# echo "$(date) - Thu muc $LOGFOLDER ton tai."
# echo ¨Danh sach file trong thu muc $LOGFOLDER:¨
# ls -l "$LOGFOLDER"


# BACKUP_DIR="/home/thong-le/Documents/shell-sscript_backup_$(date +"%Y%m%d_%H%M%S")"
# cp -r "$LOGFOLDER" "$BACKUP_DIR"
# if [ $? -eq 0 ]; then
#     echo "$(date) - Backup folder $LOGFOLDER to $BACKUP_DIR tao thanh cong."
# else
#     echo "$(date) - Backup folder $LOGFOLDER khong thanh cong."
# fi


echo "Cap nhat code tu nhanh $branch_name"
git checkout "$branch_name"
git pull origin "$branch_name"
if [ $? -eq 0 ]; then
    echo "$(date) - Cap nhat code tu nhánh $branch_name thanh cong."
else
    echo "$(date) - Cap nhat code tu nhánh $branch_name that bai."
fi
