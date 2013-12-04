#!/bin/bash

# Clean idea files from the current location

function rmpattern() {
  echo "rm pattern $1"
  for i in $(f $1); do rm $i; done
}

for i in "iml" "ipr" "iws"; do rmpattern $i; done
