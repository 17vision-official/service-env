#!/bin/bash

# 等待 MySQL 启动
until mysqladmin ping -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

# 导入数据
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /docker-mysql/holovision.sql

# 修改 user 表中的默认的用户账号、手机号码、密码
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF
-- UPDATE users SET account = $MANGER_ACCOUNT, phone = $MANGER_PHONE WHERE id = 1
EOF

exec "$@"