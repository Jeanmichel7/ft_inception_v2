# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm

RUN apt-get update && apt-get install -y apt-utils \
libterm-readline-gnu-perl dialog procps \
    nginx \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/nginx/ssl/

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/jrasser.42.pem -keyout /etc/nginx/ssl/jrasser.42.key -subj "/C=FR/ST=Mulhouse/L=Mulhouse/O=42 School/OU=jrasser/CN=jrasser.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
