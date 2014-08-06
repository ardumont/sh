#!/usr/bin/env bash

pidof emacs && emacsclient --create-frame || emacs --daemon
