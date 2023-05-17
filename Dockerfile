FROM ubuntu:mantic
COPY entrypoint.sh /entrypoint
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install software-properties-common -y --no-install-recommends && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    apt-get install steamcmd -y --no-install-recommends && \
    apt-get autoremove --purge software-properties-common -y && \
    apt-get clean && \
    ln -s /usr/games/steamcmd /usr/bin/steamcmd && \
    steamcmd +quit && \
    chmod +x /entrypoint
CMD ["bash", "-c", "/entrypoint"]
