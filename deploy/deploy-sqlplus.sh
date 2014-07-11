#!/bin/bash -x

# Not working yet so dl manually at the moment
retrieve-oracle-soft () {
  URL=$1
  DEST_FILE=$2

  [ ! -f $DEST_FILE ] && \
    wget --quiet \
        --no-cookies \
        --no-check-certificate \
        --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Ftopics%2Flinuxx86-64soft-092277.html;" \
        "$URL" \
        --output-document $DEST_FILE
}

DEST_DIR=$HOME/Downloads

retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm
retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.rpm $DEST_DIR/oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.rpm
retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.rpm

sudo aptitude install -y alien

for package in *.rpm; do sudo alien --to-deb $package; done

cd $DEST_DIR

sudo dpkg -i oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.deb oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.deb oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.deb
