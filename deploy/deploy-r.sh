#!bash -x

# Use
# deploy the r package

WDIR=$(dirname $0)

$WDIR/deploy-apt-repo.sh deb http://cran.univ-paris1.fr/bin/linux/ubuntu quantal/

$WDIR/install.sh r-base ess
