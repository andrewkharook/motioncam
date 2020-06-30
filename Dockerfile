FROM debian:${DEBIAN_VER:-bullseye}-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
                              motion curl tzdata \
                   && apt-get autoclean \
                   && apt-get autoremove \
                   && rm -rf /var/lib/apt/lists/*

RUN mkdir /mnt/motion && chown motion /mnt/motion

EXPOSE 8080-8100

ENTRYPOINT ["motion", "-c /root/.motion/motion.conf"]
