FROM php:7.1-alpine

ARG COMPOSER_OPTS

RUN apk --no-cache add curl git openssl graphviz

COPY . /app
WORKDIR /app

RUN /app/bin/install-composer.sh && composer update $COMPOSER_OPTS \
    && composer global require kherge/box --prefer-source \
    && echo "phar.readonly = Off;" > $PHP_INI_DIR/conf.d/phar.ini
