#!/bin/bash
echo "cpu info"
top -b -n 1 |grep Cpu | cut -d "," -f 1 | cut -d ":" -f 2
echo "docker info"
docker stats -a --no-stream | grep 8000   #kill `docker stats -a  ` &
echo "---------------------------------------------------------------"
echo "men info"
#free -h
top -b -n 1 |grep Mem | cut -d "," -f 3
echo "---------------------------------------------------------------"
echo "disk info"
disk1=`df -h  | grep vda | awk '{print $5}'`
disk2=`df -h  | grep vdb | awk '{print $5}'`
echo "/-$disk1"
echo "data-$disk2"
echo "---------------------------------------------------------------"
echo "当前区块高度"
curl -s http://127.0.0.1/fbs/bct/pbbio.do --stderr - |awk -F '[:|,]' '{print $2}'
echo "---------------------------------------------------------------"
echo "错误日志量"
cat /mnt/cwv/logs/8000/app.log  | awk -F: '{print $5}' | grep ERROR | wc -l
#cat /mnt/cwv/logs/8000/app.log | grep ERROR | wc -l
echo "---------------------------------------------------------------"
date
