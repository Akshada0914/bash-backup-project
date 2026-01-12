#!/bin/bash
SOURCE_DIR="source_data"
BACKUP_DIR="backups"
LOG_DIR="logs"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$DATE.tar.gz"
LOG_FILE="$LOG_DIR/backup.log"
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR" 2>> "$LOG_FILE"
if [ $? -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup failed for: $SOURCE_DIR" >> "$LOG_FILE"
fi