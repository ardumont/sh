#!/usr/bin/env bash

FILE=~/.ssh-agent-identity

if [ ! -f $FILE ] ; then
    echo "Use: $0"
    echo "Will load the identity you reference in the file '$FILE': one identity per line"
    echo ""
    echo "Example of $FILE's content:"
    echo "/home/user/.ssh/id_rsa"
    echo "/home/user/.ssh/id_rsa-for-job"
    exit 1;
fi

for key in $(cat $FILE);
do
    # Is the key already loaded into the ssh-agent?
    ssh-add -L | grep "$key"
    if [ $? -ne 0 ]; then
        ssh-add $key
    fi
done
