#!/bin/bash

# Is the key already loaded into the ssh-agent
ssh-add -l | grep "/home/tony/.ssh/id_rsa"
if [ $? -ne 0 ]; then
    # add id_rsa
    ssh-add
fi

[ -f ~/work/bin/work-ssh-add.sh ] && ~/work/bin/work-ssh-add.sh

