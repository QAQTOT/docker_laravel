# image about Laravel with php and nginx

## dockerfile
    FROM php:8.0-fpm-alpine
    LABEL maintainer="stormliang"
    laravel new {$project_name}
    WORKDIR /var/www/{$project_name}
    COPY . /var/www/{$project_name}
    # {start service}
    RUN chmod 777 /var/www/{$project_name}
    # {VOLUME somethings}

### start with nginx
    mkdir /run/nginx
    touch /run/nginx/nginx.pid
    nginx
    ADD nginx.conf /etc/nginx/nginx.conf
### [VERSION]
    php-fpm:8.0 and laravel:8.5

### [PHP Modules]
    bcmath
    calendar
    Core
    ctype
    curl
    date
    dba
    dom
    exif
    fileinfo
    filter
    ftp
    gd
    gettext
    hash
    iconv
    inotify
    json
    libxml
    mbstring
    mysqli
    mysqlnd
    openssl
    pcntl
    pcre
    PDO
    pdo_mysql
    pdo_sqlite
    Phar
    posix
    readline
    redis
    Reflection
    session
    shmop
    SimpleXML
    sockets
    sodium
    SPL
    sqlite3
    standard
    swoole
    sysvmsg
    sysvsem
    sysvshm
    tokenizer
    xml
    xmlreader
    xmlwriter
    Zend OPcache
    zlib

### [Zend Modules]
    Zend OPcache