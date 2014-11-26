FROM renegare/nginx:1.6.2
MAINTAINER Mudi Renegare <mudi@renegare.com>

RUN apt-get update

RUN apt-get install -y \
    php5-fpm php5-cli \
    php5-mysql php5-json \
    php5-pgsql php5-sqlite \
    php5-imagick php5-gd \
    php5-intl php5-mcrypt \
    php5-memcache php5-memcached \
    php5-mongo php5-apcu

RUN /bin/bash -c "wget http://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer"
RUN chmod +x /usr/local/bin/composer

RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

WORKDIR /var/www/html

CMD service php5-fpm start && nginx
