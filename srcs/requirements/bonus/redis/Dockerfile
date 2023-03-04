# syntax=docker/dockerfile:1

FROM debian:buster

RUN apt-get update && apt-get install -y \
    apt-utils \
    libterm-readline-gnu-perl dialog \
    init-system-helpers \
    libc6 \
    lsb-base \
    lsb-release \
    redis-tools \
    redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

EXPOSE 6379

COPY --chown=redis conf/redis.conf /etc/redis/redis.conf
CMD ["redis-server", "/etc/redis/redis.conf"]