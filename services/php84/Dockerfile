# 使用 ARG 允许构建时动态指定 PHP 镜像版本
ARG PHP_IMAGE
FROM ${PHP_IMAGE}

# 设置环境变量，避免交互式安装提示
ENV DEBIAN_FRONTEND noninteractive

# 安装系统依赖和扩展（合并 RUN 命令减少镜像层)
RUN apt-get update && apt-get install -y  \
        # 图像处理相关依赖
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        # 数据库相关依赖
        libpq-dev \
        # 国际化支持
        libicu-dev \
        # 压缩相关
        libzip-dev \
        # Imagick 依赖
        libmagickwand-dev \
        # 定时任务
        cron \
        # 清理缓存减小镜像体积
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# 安装并配置 GD 扩展（图像处理）
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# 安装 PostgreSQL 支持
RUN docker-php-ext-install pdo_pgsql pgsql

# 安装 MySQL 支持
RUN docker-php-ext-install pdo pdo_mysql mysqli

# 安装国际化扩展
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl

# 安装 ZIP 扩展
RUN docker-php-ext-install zip

# 安装数学扩展
RUN docker-php-ext-install bcmath

# 安装 PECL 扩展（Imagick 和 Redis）
RUN pecl install imagick redis \
    && docker-php-ext-enable imagick redis

# 启用 OPcache（生产环境性能优化）
RUN docker-php-ext-enable opcache

# 配置 cron 服务
RUN touch /var/log/cron.log \
    && chmod 644 /var/log/cron.log \
    && service cron start

# 安装 Composer（使用官方多阶段构建镜像）
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

# 设置工作目录
WORKDIR /www