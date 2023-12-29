#!/bin/sh

echo "---------- start init skynet env ----------"

# 将配置文件移动到 supervisord 配置文件中
mv /services/supervisord/* /etc/supervisor.d/

echo "ready"

# 启动服务
supervisorctl start all