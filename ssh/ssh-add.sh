#!/bin/bash -x

for key in $(cat ~/bin/ssh/identity);
do
    # Is the key already loaded into the ssh-agent?
    ssh-add -L | grep "$key"
    if [ $? -ne 0 ]; then
        ssh-add $key
    fi
done
