#!/bin/bash

cd $(dirname $0)
cd ../

BUILDER_IMAGE="ubuntu:24.04"
RUNNER_IMAGE="ubuntu:24.04"
IMAGE_NAME=$(basename $(pwd) | tr '[:upper:]' '[:lower:]')

docker build \
    --build-arg BUILDER_IMAGE=${BUILDER_IMAGE} \
    --build-arg RUNNER_IMAGE=${RUNNER_IMAGE} \
    -t "${IMAGE_NAME}:latest" \
    -f docker/Dockerfile .
