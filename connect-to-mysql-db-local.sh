#!/bin/sh

USER=wikeo
PASSWD=wikeo
SERVER=localhost
DATABASE=wikeocoredb

echo "mysql -u $USER -p$PASSWD -h $SERVER $DATABASE"
mysql -u $USER -p$PASSWD -h $SERVER $DATABASE

