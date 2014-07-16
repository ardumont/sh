#!bash -xe

# Use
# $0 /path/to/repo-which-contains-the-project-clj-file
# Will fetch the sources of the repo

[ -f $1 ] && cd $(dirname $1) || exit 0

lein pom
mvn dependency:sources
rm pom.xml
