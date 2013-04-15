#!/bin/bash -xe

WDIR=$(dirname $0)

$WDIR/deploy-home-links.sh
$WDIR/deploy-dot-files.sh
$WDIR/deploy-emacs-live.sh
