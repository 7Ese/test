#!/bin/bash

host=$1
hostname
docker run --name zabbix-agent -p 20050:10050 -e ZBX_SERVER_HOST=13.229.79.170 -e ZBX_HOSTNAME=k8s-t-6 --restart=always -d zabbix/zabbix-agent:latest