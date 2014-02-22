#!/bin/bash -xe

[ ! -z "$(pidof emacs)" ] && emacsclient -e '(kill-emacs)'
