# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm
ENV PATH /usr/local/bin:/usr/bin:/bin

ARG MYSQL_USER \
MYSQL_PASSWORD \
MYSQL_DATABASE \
MYSQL_HOSTNAME

RUN apt-get update && apt-get -y install apt-utils \
libterm-readline-gnu-perl dialog \
mariadb-client \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz &&\
tar -xvzf latest.tar.gz &&\
rm -rf latest.tar.gz &&\
mkdir -p /var/www/html &&\
mv wordpress /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php && \
chown -R www-data:www-data /var/www/html/wordpress &&\
chmod -R 755 /var/www/html/wordpress

WORKDIR /var/www/html

COPY ./conf/create_wp.sh .
RUN chmod +x create_wp.sh
ENTRYPOINT ["/var/www/html/create_wp.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
