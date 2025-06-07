#!/bin/bash

cd $(dirname $0)
cd ../

IMAGE_NAME=$(basename $(pwd) | tr '[:upper:]' '[:lower:]')
USER_ID=`id -u`
GROUP_ID=`id -g`
GROUP_NAME=`id -gn`
USER_NAME=$USER

GPU_OPTION=""
if docker system info | grep -qE '^\s*Runtimes: .*nvidia.*'; then
    # Use GPU
    GPU_OPTION="--gpus all"
fi

# Check if TTY is available (not in CI environment)
TTY_OPTION=""
if [ -t 0 ] && [ -t 1 ]; then
    TTY_OPTION="-it"
fi

docker run \
    $TTY_OPTION \
    $GPU_OPTION \
    --rm \
    --shm-size=32g \
    --net host \
    --env DISPLAY=$DISPLAY \
    --env USER_NAME=$USER_NAME \
    --env USER_ID=$USER_ID \
    --env GROUP_NAME=$GROUP_NAME \
    --env GROUP_ID=$GROUP_ID \
    --workdir /app \
    -v $HOME/.Xauthority:/home/$USER_NAME/.Xauthority:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v ${PWD}:/app \
    --name "${IMAGE_NAME}-$(date '+%s')" \
    "${IMAGE_NAME}:latest" \
    ${@:-bash}
