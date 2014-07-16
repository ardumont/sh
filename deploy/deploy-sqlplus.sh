#!bash -x

install.sh alien libaio-dev

DEST_DIR=$HOME/Downloads

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

# convert if need be and then install the converted rpm
convert-oracle-soft () {
    FILE_INPUT=$1
    FILE_OUTPUT=$2

    # convert if need be
    [ ! -f $FILE_OUTPUT ] && \
        sudo alien --to-deb $FILE_INPUT

    # install the converted file
    sudo dpkg -i $FILE_OUTPUT
}

retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm
retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.rpm $DEST_DIR/oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.rpm
retrieve-oracle-soft http://download.oracle.com/otn/linux/instantclient/121010/oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.rpm

convert-oracle-soft $DEST_DIR/oracle-instantclient12.1-basic-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-basic_12.1.0.1.0-2_amd64.deb
convert-oracle-soft $DEST_DIR/oracle-instantclient12.1-sqlplus-12.1.0.1.0-1.x86_64.rpm $DEST_DIR/oracle-instantclient12.1-sqlplus_12.1.0.1.0-2_amd64.deb
convert-oracle-soft $DEST_DIR/oracle-instantclient12.1-devel-12.1.0.1.0-1.x86_64.rpm   $DEST_DIR/oracle-instantclient12.1-devel_12.1.0.1.0-2_amd64.deb
