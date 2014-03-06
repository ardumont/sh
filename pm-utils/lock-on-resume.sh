#!/bin/bash

USER=tony

case $1 in
    suspend|hibernate)
        echo "Nothing to do"
        ;;
    resume|thaw)
        su -l $USER -c "xscreensaver-command -l" &
        ;;
esac
