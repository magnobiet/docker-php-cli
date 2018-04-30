FROM php:7.2-cli-alpine

LABEL maintainer="Magno Biét <magno.biet@gmail.com>"

ENV PORT=8000

RUN apk update
RUN apk add --no-cache mysql-client postgresql-dev

RUN docker-php-ext-configure pdo_mysql
RUN docker-php-ext-configure pdo_pgsql

RUN docker-php-ext-install pdo_mysql pdo_pgsql

WORKDIR /app
VOLUME ["/app"]

EXPOSE $PORT
