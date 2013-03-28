#!/bin/sh

USER=$1
PASSWD=$2
SERVER=$3
DATABASE=$4
DUMP_FILE=$5

if [ $# -ne 5 ]; then
    cat <<EOF
Use: $0 <USER> <PASSWD> <SERVER> <DB_NAME> <DUMP_FILE>
  - <USER> the database user
  - <PASSWD> the password for the database user
  - <SERVER> the server to connect to
  - <DB_NAME> the database to connect to
  - <DUMP_FILE> the dump file to import

  This triggers the import of the dump file using the connection to the <DB_NAME> on the <SERVER> using the <USER>/<PASSWD> couple.

Example:
  $0 eleves eleves localhost eleves eleves.sql
EOF

    exit 1
fi

CMD="mysql -u $USER -p$PASSWD -h $SERVER $DATABASE < $DUMP_FILE"

echo $CMD
$CMD
