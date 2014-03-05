#!/bin/bash

setxkbmap \
    -model "pc105" \
    -layout "us" \
    -option \
    -option ctrl:nocaps \
    -option terminate:ctrl_alt_bkspc \
    -option altwin:meta_alt
