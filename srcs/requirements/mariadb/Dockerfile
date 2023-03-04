# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm

RUN apt-get update && apt-get -y install apt-utils \
libterm-readline-gnu-perl dialog mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/mysqld \
    && chmod -R 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/wp_save.sql /usr/local/bin/
COPY ./conf/create_db.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/create_db.sh && chmod 777 /usr/local/bin/wp_save.sql

ENTRYPOINT [ "create_db.sh" ]
CMD ["mysqld", "--bind-address=0.0.0.0"]