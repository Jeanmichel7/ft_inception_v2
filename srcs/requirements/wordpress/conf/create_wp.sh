#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	cd /var/www/html/wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	sed -i "s/define('WP_DEBUG', false);/define('WP_DEBUG', true);/g" wp-config-sample.php
	sed -i "s/define('WP_DEBUG_LOG', false);/define('WP_DEBUG_LOG', true);/g" wp-config-sample.php
	sed -i "s/define('WP_DEBUG_DISPLAY', false);/define('WP_DEBUG_DISPLAY', true);/g" wp-config-sample.php
	sed -i "s/display_errors = Off/display_errors = On/g" /etc/php/7.3/fpm/php.ini
#config redis
	sed -i "s/define('WP_CACHE', false);/define('WP_CACHE', true);/g" wp-config-sample.php
	echo "define('WP_REDIS_HOST', 'redis');" >> wp-config-sample.php
	echo "define('WP_REDIS_PORT', 6379);" >> wp-config-sample.php
	echo "define('WP_REDIS_DATABASE', 0);" >> wp-config-sample.php
	echo "define('WP_REDIS_TIMEOUT', '1');" >> wp-config-sample.php
	echo "define('WP_REDIS_READ_TIMEOUT', 1);" >> wp-config-sample.php

	mv wp-config-sample.php wp-config.php
	chmod -R 0777 wp-content wp-admin wp-includes
	chown -Rf www-data:www-data /var/www/html
fi

exec "$@"