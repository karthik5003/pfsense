#!/bin/sh
#

# Description: Backup pfSense config xml file to remote server and remove backups older than X date.
# Usage: ./backup-config.sh
#

REMOTE_HOST="host.domain.com"
REMOTE_DIR="/path-to-backup/pfsense"
DAYS=30  #Number of days of backups to keep on REMOTE_HOST

# Copy pfSense config xml file to remote host
/usr/bin/scp /cf/conf/config.xml $REMOTE_HOST:$REMOTE_DIR/config-$HOST-`date +%Y%m%d%H%M%S`.xml

# Cleanup backed up files on remote host older than x days
/usr/bin/ssh -t $REMOTE_HOST "/bin/find $REMOTE_DIR -mtime +$DAYS -exec rm {} \;"

exit 0
