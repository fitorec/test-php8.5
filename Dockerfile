FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_PREFIX=/usr/local/php85
ENV PHP_VERSION=8.5.0alpha1
ENV PHP_SRC_URL=https://downloads.php.net/~daniels/php-8.5.0alpha1.tar.bz2

RUN apt update && apt install -y \
    wget curl git unzip zip \
    build-essential autoconf bison re2c pkg-config \
    libxml2-dev libsqlite3-dev libssl-dev \
    libcurl4-openssl-dev libonig-dev zlib1g-dev \
    libzip-dev libreadline-dev libmysqlclient-dev \
    libpng-dev libjpeg-dev libfreetype6-dev libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

RUN wget ${PHP_SRC_URL} -O php.tar.bz2 && \
    tar -xjf php.tar.bz2 && \
    mv php-${PHP_VERSION} php-src

WORKDIR /usr/src/php-src

RUN ./buildconf && \
    ./configure --prefix=$PHP_PREFIX \
        --enable-debug \
        --enable-mbstring \
        --with-openssl \
        --with-zlib \
        --with-curl \
        --with-mysqli \
        --with-pdo-mysql \
        --with-zip \
        --with-readline \
    && make -j$(nproc) && make install

ENV PATH="${PHP_PREFIX}/bin:$PATH"

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
CMD [ "php", "-a" ]
