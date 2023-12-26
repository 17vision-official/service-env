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




