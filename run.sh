#!/bin/bash
# =====================================================
# Run Universal ROS Noetic Container
# =====================================================

CONTAINER_NAME=ros_noetic_xacro_converter
IMAGE_NAME=ros:noetic-xacro-converter

# Allow X11 GUI apps from container
xhost +local:root


# If a previous container with the same name exists, stop and remove it to avoid name conflicts
existing_id=$(docker ps -a --filter "name=^${CONTAINER_NAME}$" --format '{{.ID}}')
if [ -n "$existing_id" ]; then
    echo "Found existing container with name '${CONTAINER_NAME}' (ID: $existing_id). Stopping and removing..."
    docker stop "$CONTAINER_NAME" >/dev/null 2>&1 || true
    docker rm "$CONTAINER_NAME" >/dev/null 2>&1 || true
fi

docker build -t ros:noetic-xacro-converter .

docker run -it \
    --rm \
    --name $CONTAINER_NAME \
    --net=host \
    --volume="$PWD/ws:/root/ros_ws:rw" \
    --workdir="/root/ros_ws" \
    $IMAGE_NAME

xhost -local:root