#!/bin/bash

[ $# == 0 ] && exit 1

name=openrefine

if [ "$1" == "run" ]
then
  [ -f container_id ] && docker rm $(cat container_id)
  docker run -p 3333:3333 --name ${name} -d ${name} > container_id
elif [ "$1" == "stop" ]
then
  docker stop $(cat container_id)
elif [ "$1" == "bash" ]
then
  docker exec -it ${name} bash
elif [ "$1" == "logs" ]
then
  docker logs $(cat container_id)
elif [ "$1" == "build" ]
then
  docker build --tag ${name} .
elif [ "$1" == "push" ]
then
  [ $# != 3 ] && echo "Missing parameters: <your docker id> <version>" && exit 1
  docker tag ${name} $2/${name}:$3
  docker push $2/${name}:$3
else
  echo "Unknown command: $1"
  echo "Commands:"
  echo "  run"
  echo "  stop"
  echo "  bash"
  echo "  logs"
  echo "  build"
  echo "  push <your docker id> <version>"
fi

