#!/bin/bash
#安装mysql
docker run --name mysql-server -t \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd_123" \
-e MYSQL_ROOT_PASSWORD="root_pwd_123" \
-v /mnt/mysql-data:/var/lib/mysql \
-d mysql:5.7
#安装java-gateway
docker run --name zabbix-java-gateway -t -d zabbix/zabbix-java-gateway:latest
#安装zabbix-server
docker run --name zabbix-server-mysql -t \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd_123" \
-e MYSQL_ROOT_PASSWORD="root_pwd_123" \
-e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
--link mysql-server:mysql \
--link zabbix-java-gateway:zabbix-java-gateway \
-p 10051:10051 \
-d zabbix/zabbix-server-mysql:latest
#安装zabbix-nginx
docker run --name zabbix-web-nginx-mysql -t \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd_123" \
-e MYSQL_ROOT_PASSWORD="root_pwd_123" \
--link mysql-server:mysql \
--link zabbix-server-mysql:zabbix-server \
-p 38000:80 \
-d zabbix/zabbix-web-nginx-mysql:latest
docker run -d --restart=always $add_host -p $hport:8000 -p $tport:5100 --name $name-$hport $logs $db $modules $conf -e JAVA_OPTS="$javaopts" registry.cn-hangzhou.aliyuncs.com/cwv/bruntime:$images
#监控项 
#docker run --name zabbix-agent -p 10050:10050 -e ZABBIX_SERVER=18.188.195.69 -e HOSTNAME=zabbix-server --restart=always -dl zabbix/zabbix-agent:latest
docker run --name zabbix-agent -p 20050:10050 -e ZBX_SERVER_HOST=13.229.79.170 -e ZBX_HOSTNAME=k8s-t-6 --restart=always -d zabbix/zabbix-agent:latest
