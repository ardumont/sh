#!/bin/bash

# Is the key already loaded into the ssh-agent
ssh-add -L | grep id_rsa
if [ $? -ne 0 ]; then
    # add id_rsa
    ssh-add
fi

