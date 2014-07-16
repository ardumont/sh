#!bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker images | xargs docker rmi
