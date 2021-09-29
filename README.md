# image about Laravel with php and nginx

## dockerfile
    FROM stormliang/phpfpm8-laravel8.5
    LABEL maintainer="stormliang"
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
    php-fpm:8.0 and composer update
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
    zip

### [Zend Modules]
    Zend OPcache