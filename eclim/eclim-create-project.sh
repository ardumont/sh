#!/bin/bash

[ $# -ne 2 ] && echo "Use: $0 <PROJECT_FOLDER> <PROJECT_NAME>
PROJECT_FOLDER Folder to make an eclipse project
PROJECT_NAME   Name of the project" && exit 1

PROJECT_FOLDER=$1
PROJECT_NAME=$2

./eclim -command project_create -f $PROJECT_FOLDER -p $PROJECT_NAME -n java
