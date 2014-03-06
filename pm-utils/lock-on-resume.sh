#!/bin/bash

# Action script to ensure the session is locked when resuming
#
# Copyright: Copyright (c) 2014 Antoine R. Dumont
# License:   GPL-2
#

USER=tony
case $1 in
    suspend|hibernate)
        echo "Nothing to do"
        ;;
    resume|thaw)
        su -l $USER -c "/home/$USER/bin/session/lock.sh" &
        ;;
esac
