#!/usr/bin/env bash

PHONE_MAC_ADDRESS=C0:EE:FB:27:21:BE
PHONE_NAME=ardumont-oneplus
LOCK=no

while sleep 1; do
    SCAN_NAMED=$(hcitool name $PHONE_MAC_ADDRESS)
    echo "name: $SCAN_NAMED"
    if [ "x$SCAN_NAMED" = "x$PHONE_NAME" ];
    then
        if [ $LOCK = yes ];
        then
            echo 'Unlocked'
            kill $LOCKPID
        fi

        LOCK=no
    else
        if [ $LOCK = no ];
        then
            echo 'Locked'
            xtrlock -b &
            LOCKPID=$?
        fi
        LOCK=yes
    fi
done
