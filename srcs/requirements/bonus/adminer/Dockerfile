# syntax=docker/dockerfile:1
FROM debian:buster

ENV TERM xterm

RUN apt-get update && \
    apt-get install -y apt-utils libterm-readline-gnu-perl dialog apache2 php libapache2-mod-php php-mysql php-mbstring curl && \
    mkdir -p /var/www/adminer && \
    cd /var/www/adminer && \
    curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && \
    chown -R root:root /var/www/

WORKDIR /var/www

EXPOSE 8080

CMD ["php", "-S", "[::]:8080", "-t", "/var/www/"]

# # Copier la configuration Apache pour Adminer
# COPY adminer.conf /etc/apache2/sites-available/

# # Activer la configuration et redémarrer Apache
# RUN a2ensite adminer.conf && \
#     service apache2 restart

