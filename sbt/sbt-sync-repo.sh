#!bash -xe

# Use
# $0 <path-to-repo>
# Will sync the deps of the repo

[ -f $1 ] && cd $(dirname $1) || exit 0

sbt test
