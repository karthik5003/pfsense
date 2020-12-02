#!/bin/sh
#

# Description: Backup pfSense config xml file to remote server and remove backups older than X date.
#SSH Login Without Password Using ssh-keygen & ssh-copy-id to REMOTE_HOST from pfSense
# Usage: ./backup-config.sh
#

REMOTE_HOST="centos@192.168.1.102"
REMOTE_DIR="/home/centos/pfsense"
#DAYS=30  #Number of days of backups to keep on REMOTE_HOST

# Copy pfSense config xml file to remote host
/usr/bin/scp /cf/conf/config.xml $REMOTE_HOST:$REMOTE_DIR/config-fw.hackerrank.com-`date +%Y%m%d%H%M%S`.xml

# Cleanup backed up files on remote host older than x days
#/usr/bin/ssh -t $REMOTE_HOST "/bin/find $REMOTE_DIR -mtime +$DAYS -exec rm {} \;"

exit 0