FROM jnjam6681/nginx-php:7.2-fpm

COPY composer.json /var/www/html/

COPY package*.json /var/www/html/

WORKDIR /var/www/html

RUN composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts

RUN npm install

COPY . /var/www/html/

RUN chown -R www-data:www-data \
    /var/www/storage \
    /var/www/bootstrap/cache
