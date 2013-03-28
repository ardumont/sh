#!/bin/sh

USER=$1
PASSWD=$2
SERVER=$3
DATABASE=$4

if [ $# -ne 4 ]; then
    cat <<EOF
Use: $0 <USER> <PASSWD> <SERVER> <DB_NAME>
  - <USER> the database user
  - <PASSWD> the password for the database user
  - <SERVER> the server to connect to
  - <DB_NAME> the database to connect to

  This triggers the connection to the <DB_NAME> on the <SERVER> using the <USER>/<PASSWD> couple.

Example:
  $0 eleves eleves localhost eleves
EOF

    exit 1
fi


CMD="mysql -u $USER -p$PASSWD -h $SERVER $DATABASE"

echo $CMD
$CMD
