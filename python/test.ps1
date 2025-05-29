$CONTAINER_NAME="python_docker"

if (docker ps -a | Select-String $CONTAINER_NAME) {
  Write-Output "Container $CONTAINER_NAME already exists. Removing..."
  docker rm --force $CONTAINER_NAME
}

if (docker images | Select-String $CONTAINER_NAME) {
  Write-Output "Image $CONTAINER_NAME already exists. Removing..."
  docker rmi --force $CONTAINER_NAME
}

Write-Output "Building container $CONTAINER_NAME..."
docker build . -t $CONTAINER_NAME

Write-Output "Running container $CONTAINER_NAME..."
docker run --rm -it --name $CONTAINER_NAME $CONTAINER_NAME

