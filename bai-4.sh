
LOGFOLDER="/home/thong-le/Documents/depoly"
LOGFILE="/home/thong-le/Documents/deploy.log"


BACKUP_DIR="/home/thong-le/Documents/deploy_backup_$(date +"%Y%m%d_%H%M%S")"
cp -r "$LOGFOLDER" "$BACKUP_DIR"
if [ $? -eq 0 ]; then
    echo "$(date) - Backup folder $LOGFOLDER to $BACKUP_DIR tao thanh cong."
else
    echo "$(date) - Backup folder $LOGFOLDER khong thanh cong."
fi

echo "Cap nhat code tu nhanh $branch_name"
git checkout "$branch_name"
git pull origin "$branch_name"
if [ $? -eq 0 ]; then
    echo "$(date) - Cap nhat code tu nhánh $branch_name thanh cong."
else
    echo "$(date) - Cap nhat code tu nhánh $branch_name that bai."
fi

echo "Chay Test...."
./deploy.sh >> "$LOGFILE" 2>&1

echo ¨khoi dong lai chuong trinh deploy...¨
sudo systemctl restart thong-le-app.service >> "$LOGFILE" 2>&1


rollback_function() {
log_info "Rollback: khôi phục từ backup $BACKUP_DIR"
cp -r "$BACKUP_DIR" ¨$LOGFOLDER¨
sudo systemctl restart backend-service
exit 1
}