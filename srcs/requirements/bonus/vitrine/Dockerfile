# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/conf.d
COPY www/ /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
