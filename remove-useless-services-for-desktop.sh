#!/bin/bash

# a lancer en tant que root (sudo avec ubuntu) pour nettoyer les services non utiles sur un desktop

# pas de carte PCMCIA
update-rc.d -f pcmciautils remove
update-rc.d -f pcmcia remove

# pas de bluetooth
update-rc.d -f bluetooth remove
update-rc.d -f bluez-utils remove 

# hotkeys (touche fn sur les portables)
update-rc.d -f hotkey-setup remove

# pas de RAID
update-rc.d -f mdadm remove
update-rc.d -f mdadm-raid remove

# pas de lvm
update-rc.d -f lvm remove

# enterprise volume management service? desktop?
update-rc.d -f evms remove

# pas de modem
update-rc.d -f dns-clean remove

