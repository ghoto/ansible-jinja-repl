#!/usr/bin/env bash

set -ex

DOCKER_IMAGE_NAME="howinator/$(basename "$(pwd)")"
DOCKER_CONTAINER_NAME='ansible-jinja-parser'

{
    RUNNING_CONTAINERS=$(docker ps | grep "$DOCKER_IMAGE_NAME")
} || {
    RUNNING_CONTAINERS=""
}
{
    STOPPED_CONTAINERS=$(docker ps -a | grep "$DOCKER_IMAGE_NAME.*" | grep -v 'Up')
} || {
    STOPPED_CONTAINERS=""
}

if [[ ! -z "$RUNNING_CONTAINERS" ]]; then
    docker stop $DOCKER_CONTAINER_NAME
    docker rm $DOCKER_CONTAINER_NAME
elif [[ ! -z "$STOPPED_CONTAINERS" ]]; then
    docker rm $DOCKER_CONTAINER_NAME
fi

docker build --no-cache -t "$DOCKER_IMAGE_NAME" .
docker run -d -p 5005:5000 --name "$DOCKER_CONTAINER_NAME" "$DOCKER_IMAGE_NAME"
