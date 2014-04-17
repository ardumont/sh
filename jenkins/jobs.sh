#!/bin/bash
# Use: $0

SERVER=http://server:8080
JOB_NAME=job-name

# export
java -jar jenkins-cli.jar -s $SERVER get-job $JOB_NAME > $JOB_NAME.xml

# import
java -jar jenkins-cli.jar -s $SERVER create-job $JOB_NAME < $JOB_NAME.xml
