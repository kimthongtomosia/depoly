
LOGFOLDER="/home/thong-le/Documents/depoly"
MAX_RETRIES=3
RETRY_COUNT=0

while [ ! -d "$LOGFOLDER" ]; do
    echo "$(date) - Thu muc khong ton tai. Thu lai lan $((RETRY_COUNT+1))..."
    RETRY_COUNT=$((RETRY_COUNT+1))
    if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
        echo "$(date) - Khong the thuc hien deploy. Ket thuc chuong trinh."
        exit 1
    fi
    sleep 5
done
echo "$(date) - Thu muc $LOGFOLDER ton tai."
echo ¨Danh sach file trong thu muc $LOGFOLDER:¨
ls -l "$LOGFOLDER"
