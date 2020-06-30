#!/bin/sh

DEBIAN_VER=bullseye
MOTION_VER=4.2
IMAGE_NAME=andrewkharook/motioncam:$DEBIAN_VER-motion-$MOTION_VER
OUTPUT_DIR=`pwd`/img
CONFIG_DIR=`pwd`/conf

mkdir -p $OUTPUT_DIR
cp $CONFIG_DIR/motion-$MOTION_VER.conf $CONFIG_DIR/motion.conf

docker run --rm --device=/dev/video0:/dev/video0 -v $OUTPUT_DIR:/mnt/motion -v $CONFIG_DIR:/root/.motion -p 3001:8081 -p 3000:8080 -e "TZ=Europe/Kiev" $IMAGE_NAME
