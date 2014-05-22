#!/bin/sh

FILEPATH=$1
GROUPID=$2
ARTEFACTID=$3
VERSION=$4
PACKAGING=jar

mvn install:install-file -Dfile=$FILEPATH -DgroupId=$GROUPID -DartifactId=$ARTIFACTID -Dversion=$VERSION -Dpackaging=$PACKAGING
