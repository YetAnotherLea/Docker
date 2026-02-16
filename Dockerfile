FROM dunglas/frankenphp

RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /app

RUN mkdir -p /app/var/cache /app/var/log && chmod -R 777 /app/var