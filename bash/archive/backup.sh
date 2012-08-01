#!/bin/bash


BACKUPDIR=/tmp
SCRIPTDIR=/home/joeblow/Scripts
BACKUPFILE=scripts.backup.`date +%F`.tgz


tar -czvf $BACKUPDIR/$BACKUPFILE $SCRIPTDIR > /dev/null
