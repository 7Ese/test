#!/bin/bash
#doufangyu
#2018-11-13
echo `cat /mnt/cwv/logs/8000/app.log | grep ERROR > /mnt/cwv/logs/8000/err.log`
last_nmb=`cat /zabbix/shell/log_nmb.log`
nmb=`cat /mnt/cwv/logs/8000/app.log | grep ERRPR |wc -l`



msg=`tail -n +${last_nmb} /mnt/cwv/logs/8000/err.log  `
count=`echo "$msg" | wc -l`

if [ ! -n "$msg" ];then
        echo "OK"
        exit 0
fi
if [ $count -gt 0 ];then
        echo "$msg"
        exit 1
else
        echo "OK"
        exit 0
fi

echo ${nmb} > /etc/zabbix/shell/log_nmb.log
