#!/usr/bin/env bash

yum -y remove zabbix*
yum clean all
rm -rf /var/cache/yum
rpm -i https://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm
yum install  -y zabbix-agent
sed -i 's/Server=127.0.0.1/Server=39.105.157.233/g' /etc/zabbix/zabbix_agentd.conf
systemctl start zabbix_agentd
systemctl status zabbix-agent
systemctl enable zabbix_agentd
systemctl disable zabbix_agentd

yum remove -y zabbix-agent
