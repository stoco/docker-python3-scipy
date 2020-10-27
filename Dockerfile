#
# STOCO SciPy Dockerfile
#
# https://github.com/stoco/docker-python3-scipy
#

# Pull base image
FROM debian:buster
MAINTAINER William MARTIN <william.martin@power-lan.com>
ENV DEBIAN_FRONTEND noninteractive

# Install SciPy
RUN echo "APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/no-recommends && \
    echo "APT::Install-Suggests \"0\";" > /etc/apt/apt.conf.d/no-suggests && \
    apt-get update && \
    apt-get upgrade --yes && \
    apt-get install --yes bash \
                          python3-scipy \
                          python3-systemd \
                          python3-zmq && \
    rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

CMD ["/usr/bin/python3"]
