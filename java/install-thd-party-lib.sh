#!/bin/sh

[ $# -ne 4 ] && echo "Use: $0 <FILEPATH> <GROUPID> <ARTEFACTID> <VERSION>" && return 1

FILEPATH=$1
GROUPID=$2
ARTEFACTID=$3
VERSION=$4
PACKAGING=jar

mvn install:install-file -Dfile=$FILEPATH -DgroupId=$GROUPID -DartifactId=$ARTIFACTID -Dversion=$VERSION -Dpackaging=$PACKAGING
