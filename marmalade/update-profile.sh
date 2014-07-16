#!bash -e

[ $# -ne 1 ] && echo "$0 <EMAIL>" && exit 1

URL=http://marmalade-repo.org
EMAIL=$1

curl -XPOST $URL/v1/users/reset?email=$EMAIL
