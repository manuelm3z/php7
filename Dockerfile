FROM php:7-fpm

MAINTAINER Manuel Zambrano <mmzmm3z@gmail.com>

RUN apt-get update && apt-get install -y libfreetype6 libjpeg62-turbo libmcrypt4 libpng12-0 sendmail libcurl4-gnutls-dev curl --no-install-recommends \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg-dev libldap2-dev libmcrypt-dev libpng12-dev zlib1g-dev libpq-dev libpng-dev libmemcached-dev --no-install-recommends \
&& rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mcrypt mysqli pdo pdo_mysql zip session mbstring curl

RUN docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu

RUN docker-php-ext-install gd
