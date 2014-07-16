#!bash -e

# Use: $0 <DBNAME> <USER>

DBNAME=$1
USER=$2

[ $# != 2 ] && echo "Use: $0 <DBNAME> <USER>" && exit 1

stty -echo
read -p "Password for '$USER' on the db '$DBNAME':" PWD; echo
stty echo

mysql -u root -p <<EOF
CREATE DATABASE $DBNAME;
GRANT ALL PRIVILEGES ON *.* TO '$USER'@'localhost' IDENTIFIED BY '$PWD' WITH GRANT OPTION;
EOF
