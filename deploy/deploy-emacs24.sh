#!bash -x

WDIR=$(dirname $(readlink -f $0))

$WDIR/add-apt-repository.sh ppa:cassou/emacs

$WDIR/install.sh emacs-snapshot-el emacs-snapshot-gtk emacs-snapshot emacs24-el

# check for updates
sudo aptitude safe-upgrade -y

# check version
emacs --version
