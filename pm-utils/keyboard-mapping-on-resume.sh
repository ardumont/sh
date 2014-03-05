#!/bin/sh

# Action script to ensure the mapping is reinitialized at resume time
#
# Copyright: Copyright (c) 2014 Antoine R. Dumont
# License:   GPL-2
#

USER=tony
case "${1}" in
        suspend|hibernate)   # `suspend to ram` or `suspend to disk`
                # do nothing
                ;;
        resume|thaw)         # resume from `suspend to ram` or `suspend to disk`
                su -l $USER -c "/home/$USER/bin/kbd/remap-keyboard.sh" &
                ;;
esac
