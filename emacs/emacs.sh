#!/usr/bin/env bash

[ -z "$(pidof emacs)" ] && emacs --daemon || emacsclient --create-frame
