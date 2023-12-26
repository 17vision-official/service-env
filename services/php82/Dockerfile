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
    # 安装扩展
    && docker-php-ext-install iconv \
    # 如果安装的扩展需要自定义配置时
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# 安装 imagick 扩展
RUN apt-get install -y libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# mysql 相关扩展
RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install mysqli

# zip 扩展
RUN apt-get install -y libzip-dev && docker-php-ext-install zip

# 安装 bcmath 扩展
RUN docker-php-ext-install bcmath

# redis 扩展
RUN pecl install redis && docker-php-ext-enable redis

# bolt 加密相关扩展（将已编译的 .so 文件复制到扩展目录下。具体的扩展目录和 php 版本有关系，请先查阅）
COPY ./extensions/*.so /usr/local/lib/php/extensions/no-debug-non-zts-20220829/
RUN docker-php-ext-enable bolt

# 安装 composer
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar && chmod +x /usr/bin/composer

COPY ./www/index.php /www/holovision.com/public/

WORKDIR /www