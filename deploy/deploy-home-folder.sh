#!bash -xe

WDIR=$(dirname $0)

$WDIR/deploy-home-links.sh
$WDIR/deploy-emacs-live.sh
