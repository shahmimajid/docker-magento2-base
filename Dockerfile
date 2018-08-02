# Base image is nginx-php-fpm
FROM mshahmi/apache2-php7
LABEL maintainer="Shahmi Majid"

ENV MAGENTO_VERSION 2.2.10
ENV INSTALL_DIR /var/www/html
ENV COMPOSER_HOME /var/www/.composer/

RUN requirements="libpng12-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg-turbo8 libjpeg-turbo8-dev libpng12-dev libfreetype6-dev libicu-dev libxslt1-dev curl git cron" \
    && apt-get update \
    && apt-get install -y $requirements \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install xsl \
    && docker-php-ext-install soap \
    && requirementsToRemove="libpng12-dev libmcrypt-dev libcurl3-dev libpng12-dev libfreetype6-dev libjpeg-turbo8-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

COPY ./auth.json $COMPOSER_HOME
RUN cat $COMPOSER_HOME/auth.json
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN chsh -s /bin/bash www-data

RUN chown -R www-data:www-data /var/www
RUN cd /var/www/html
RUN su www-data -c "composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition . 

RUN cd $INSTALL_DIR \
    && find . -type d -exec chmod 770 {} \; \
    && find . -type f -exec chmod 660 {} \; \
    && chmod u+x bin/magento

WORKDIR $INSTALL_DIR

# Add cron job
ADD crontab /etc/cron.d/magento2-cron
RUN chmod 0644 /etc/cron.d/magento2-cron \
    && crontab -u www-data /etc/cron.d/magento2-cron