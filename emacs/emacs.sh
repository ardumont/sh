#!/bin/bash -xe

[ -z "$(pidof emacs)" ] && emacs --daemon || emacsclient --create-frame
