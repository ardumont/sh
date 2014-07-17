#/bin/bash

############## SETUP

# working directory for the parent project
DIR_PARENT=~/repositories/perso/ProjectionReloaded/pr-parent
# for the resource
DIR_RESOURCE=$DIR_PARENT/pr-resource

# working port
JETTY_PORT=8081
# debug port
JETTY_PORT_DEBUG=4001

############## SCRIPT

# go to the right directory
cd $DIR_PARENT

# unset the maven options for debugging (else it will hang for the cleaning part)
unset MAVEN_OPTS

# do some cleaning
mvn clean install

# set the options for debugging remote applications
export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=${JETTY_PORT_DEBUG},server=y"

# go to the right folder to launch jetty
cd $DIR_RESOURCE

# launch jetty
mvn -Djetty.port=$JETTY_PORT jetty:run
