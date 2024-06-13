### 说明

该配置，仅对 mysql + redis + php + nginx 进行基础的打包。php 镜像 会默认安装 gd、imagick、pdo、pdo_mysql、mysqli、redis、bolt 扩展。php 镜像会安装 composer 工具。

### 使用

#### 构建
```
docker-compose build
```

#### 导出镜像

```
docker save -o holovision.tar holovision-php:8.2 holovision-mysql:8.2 holovision-redis:7.2 holovision-nginx:1.25.3
```

#### 使用镜像

```
docker load -i ./holovision.tar
```

到此，就可以完成镜像的构建和转移使用。之所以要这么做，就是因为想让镜像可以给别的服务器或电脑使用。

- 如果没有网络，如果仅有镜像文件。运行镜像就完成常规的 lnmp 的环境配置。

### 末尾

仅仅有镜像还不够的，我们还需要对镜像的使用编排。这个时候，需要用到 `docker-compose`


### 附加

因为要用到定时任务，需要额外安装 cron  和 vim。如果可以，supervisord 也搞上

```
# 先进入 php 容器
docker exec -it xxx

# 清理升级(如果 apt-get update 慢，可以不 update)
apt-get clean && apt-get update

### 安装  vim 和 cron
apt-get install -y vim cron
```

在项目中， 准备一个 cron.txt.example 文件。内容如下。下边一行会将日志输出到指定的位置

```
* * * * * /usr/local/bin/php /www/test.holovision.com/artisan schedule:run >> /dev/null 2>&1
* * * * * /usr/local/bin/php /www/test.holovision.com/artisan schedule:run >> /www/test.holovision.com/storage/logs/cron/main.log 2>&1
```

复制一份到 cron.txt 修改对应的项目位置。然后在容器中执行.

```
# 执行定时任务（1 分钟跑一次）
crontab cron.txt

# 查看定时任务
crontab -l
```

为了确保定时任务跑起来，来看看 cron 的状态是否启动了

```
service cron status

service cron start
```




