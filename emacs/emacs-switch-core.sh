#!/usr/bin/env bash

# use: switch link in user's home folder.
# does nothing but switch link.
# will break if the links does not exist.

if [ $# -ne 1 ]; then
    echo <<EOF
Use: $0 <EMACS-EXTRA-CORE>
- <EMACS-EXTRA-CORE> name of the extra core (emacs-live, prelude) to switch to

Switch the ~/emacs.d's source in user's home direstory to the one asked.
EOF

    exit 1
fi

CORE=$1

if [ $CORE = "live" -o $CORE = "emacs-live" ]; then #emacs-live
    SOURCE=$HOME/.emacs.d-emacs-live
elif [ $CORE = "prelude" ]; then
    SOURCE=$HOME/.emacs.d-prelude
else
    echo "Unknown mode, do nothing."
    exit 1
fi

echo "Switch to emacs $CORE"
ln -nsf $SOURCE ~/.emacs.d
