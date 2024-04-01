MYSQL_ROOT_PASSWORD := $(shell cat .env | grep '^MYSQL_ROOT_PASSWORD=' | awk -F= '{print $$2}' | tr -d ' \t\n\r')

all: help

help:
	@echo "支持以下命令"
	@echo "make db  创建数据库"

db:
	@con=$$(docker ps -qf "name=mysql8.2");\\
	docker exec -i $$con bash -c "mysql -uroot -p'${MYSQL_ROOT_PASSWORD}' -e 'source /docker-entrypoint-initdb.d/init.sql'"
