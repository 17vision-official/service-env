ARG PHP_IMAGE
FROM ${PHP_IMAGE}

# 安装 gd 扩展
RUN apt-get update \
    # 相关依赖必须手动安装
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libicu-dev \
        libpq-dev \
    # 安装扩展
    && docker-php-ext-install iconv \
    # 如果安装的扩展需要自定义配置时
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install pgsql

# 安装 intl
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl

# 安装 imagick 扩展
RUN apt-get install -y libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# 安装 cron
RUN apt-get install -y cron

RUN service cron start

# mysql 相关扩展
RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install mysqli

# zip 扩展
RUN apt-get install -y libzip-dev && docker-php-ext-install zip

# 安装 bcmath 扩展
RUN docker-php-ext-install bcmath

# redis 扩展
RUN pecl install redis && docker-php-ext-enable redis

# 启用OPcache（生产环境推荐）
RUN docker-php-ext-enable opcache

# 安装 cron
RUN apt-get install -y cron

RUN service cron start

# 安装 composer
# RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar && chmod +x /usr/bin/composer
# COPY ./www/index.php /www/holovision.com/public/

# 安装最新版本的 composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

WORKDIR /www