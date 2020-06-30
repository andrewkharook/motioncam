#!/bin/sh

DEBIAN_VER=bullseye
MOTION_VER=4.2
IMAGE_NAME=andrewkharook/motioncam:$DEBIAN_VER-motion-$MOTION_VER

docker build --build-arg DEBIAN_VER=$DEBIAN_VER -t $IMAGE_NAME .
