FROM php:8.0-fpm-alpine

LABEL maintainer="stormliang"
WORKDIR /var/www
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# install composer-laravel
RUN curl https://getcomposer.org/installer|php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require laravel/installer
ENV PATH="/root/.composer/vendor/laravel/installer/bin:$PATH"
# install exif mysqli pdo_mysql
RUN apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS
RUN apk add libpng-dev freetype-dev libjpeg-turbo-dev gettext-dev
RUN apk add --no-cache --update zlib

RUN docker-php-ext-install bcmath calendar exif gettext && \
    docker-php-ext-install sockets dba mysqli pcntl pdo_mysql shmop sysvmsg sysvsem sysvshm
# install php-redis
RUN set -xe && \
    pecl install -o -f redis && \
    echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
# install swoole
RUN pecl search swoole && pecl install swoole \
    && docker-php-ext-enable swoole \
    && pecl search inotify && pecl install inotify \
    && docker-php-ext-enable inotify
# install gd
RUN docker-php-ext-configure gd --with-freetype=/usr/include/webp --with-jpeg=/usr/include/  \
        && docker-php-ext-install -j$(nproc) gd
# enable opcache
RUN docker-php-ext-enable opcache
RUN  rm -rf /var/cache/apk/*
EXPOSE 80 443
