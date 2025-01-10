#!/bin/sh

# 输出环境变量，用于调试
echo "REALM: ${REALM}"
echo "USERNAME: ${USERNAME}"
echo "PASSWORD: ${PASSWORD}"

# 替换环境变量
sed -i "s/\$REALM/${REALM}/g" /etc/turnserver.conf
sed -i "s/\$USERNAME/${USERNAME}/g" /etc/turnserver.conf
sed -i "s/\$PASSWORD/${PASSWORD}/g" /etc/turnserver.conf

# 启动 turnserver
exec "$@"