#!/bin/bash

sudo ln -s /dev/ttyACM0 /dev/ttyS42
sudo chown -R root:dialout /dev/ttyS42
