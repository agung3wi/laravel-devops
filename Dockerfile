FROM agung3wi/php7.4-apache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libicu-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY . /app
COPY .env.example /app/.env
WORKDIR /app
RUN chown www-data:www-data -R /app
RUN composer install
