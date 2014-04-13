#!/bin/bash

install.sh fluidsynth fluid-soundfont-gm jackd

# play a midi file to check it works
# fluidsynth --audio-driver=alsa /usr/share/sounds/sf2/FluidR3_GM.sf2 let-it-snow.mid

# list the audio cards on the system
# aplay -l
# tony at dagobah in ~ [11:37:00]
# $ aplay -l
# **** List of PLAYBACK Hardware Devices ****
# card 0: MID [HDA Intel MID], device 3: HDMI 0 [HDMI 0]
# Subdevices: 1/1
# Subdevice #0: subdevice #0
# card 0: MID [HDA Intel MID], device 7: HDMI 1 [HDMI 1]
# Subdevices: 1/1
# Subdevice #0: subdevice #0
# card 0: MID [HDA Intel MID], device 8: HDMI 2 [HDMI 2]
# Subdevices: 1/1
# Subdevice #0: subdevice #0
# card 1: PCH [HDA Intel PCH], device 0: ALC286 Analog [ALC286 Analog]
# Subdevices: 0/1
# Subdevice #0: subdevice #0


# or
# cat /etc/asound/cards

# tony at dagobah in ~ [11:38:40]
# $ cat /proc/asound/cards
# 0 [MID            ]: HDA-Intel - HDA Intel MID
# HDA Intel MID at 0xf7f14000 irq 60
# 1 [PCH            ]: HDA-Intel - HDA Intel PCH
# HDA Intel PCH at 0xf7f10000 irq 61

# Now the device is named after "hw:<id>" with id determined by the previous entries output
