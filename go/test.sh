#!/bin/bash
CONTAINER_NAME="golang_docker"

if (docker ps -a | grep -q $CONTAINER_NAME); then
  echo "Container $CONTAINER_NAME already exists. Removing..."
  docker rm --force $CONTAINER_NAME
fi


if (docker images | grep -q $CONTAINER_NAME); then
  echo "Image $CONTAINER_NAME already exists. Removing..."
  docker rmi --force $CONTAINER_NAME
fi

echo "Building container $CONTAINER_NAME..."
docker build . -t $CONTAINER_NAME

echo "Running container $CONTAINER_NAME..."
docker run --rm -it --name $CONTAINER_NAME $CONTAINER_NAME

