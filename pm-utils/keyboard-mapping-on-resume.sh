#!/bin/sh

# Action script to ensure the mapping is reinitialized at resume time
#
# Copyright: Copyright (c) 2014 Antoine R. Dumont
# License:   GPL-2
#

USER=tony
case "${1}" in
        resume)
	        su -l $USER -c "export DISPLAY=:0.0 ; xmodmap /home/$USER/.Xmodmap"
                ;;
esac
