FROM agung3wi/php7.4-apache
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY . /app
WORKDIR /app
RUN chown www-data:www-data -R /app
RUN composer install
