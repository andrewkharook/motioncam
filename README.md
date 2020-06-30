# Motioncam

Build a security camera with a [raspberry pi](https://www.raspberrypi.org), [docker](https://www.docker.com) and a [motion app](https://motion-project.github.io).

## Installation instructions
- Set up your Raspberry Pi (or any other computer) with the supported OS (e.g. raspbian)
- Mount the camera and make sure it works correctly (on Raspberry Pi you can use `raspistill` util for this)
- Install Docker
- Clone this repository 
- Build a Docker image by running `sh build.sh`
- Start the security camera by running `sh run.sh`

You can also run the app using docker-compose:

```
  motioncam:
    container_name: motioncam
    image: andrewkharook/motioncam:bullseye-motion-4.2
    networks:
      - motioncam
    devices:
      - /dev/video0:/dev/video0
    volumes:
      - ./rpi-motion/conf:/root/.motion
      - ./rpi-motion/img:/mnt/motion
    ports:
      - 3000:8080
      - 3001:8081
    environment:
      - TZ=Europe/Kiev
    restart: unless-stopped
```
