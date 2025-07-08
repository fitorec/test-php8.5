FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_PREFIX=/usr/local/php85
ENV PHP_VERSION=8.5.0alpha1
ENV PHP_SRC_URL=https://downloads.php.net/~daniels/php-8.5.0alpha1.tar.bz2

# Instala dependencias
RUN apt update && apt install -y \
    wget curl git build-essential autoconf bison re2c \
    pkg-config libxml2-dev libsqlite3-dev \
    libssl-dev libcurl4-openssl-dev libonig-dev \
    zlib1g-dev libzip-dev libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src

# Descarga y descomprime PHP desde la fuente oficial
RUN wget ${PHP_SRC_URL} -O php.tar.bz2 && \
    tar -xjf php.tar.bz2 && \
    mv php-${PHP_VERSION} php-src

WORKDIR /usr/src/php-src

# Construcción y compilación
RUN ./buildconf && \
    ./configure --prefix=$PHP_PREFIX --enable-debug --with-openssl --with-zlib --enable-mbstring && \
    make -j$(nproc) && \
    make install

# Agrega php al PATH
ENV PATH="${PHP_PREFIX}/bin:$PATH"

# Directorio de trabajo compartido con el host
WORKDIR /app

# Comando por defecto
CMD [ "php", "-v" ]
