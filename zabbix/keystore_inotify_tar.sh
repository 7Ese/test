#!/bin/bash
export PATH=$PATH
now_time=$(date +%F_%H-%M-%S)
backup_dir_time=$(date +%y-%m-%d)
mkdir -p /mnt/KEYSTORE_BACKUP/$backup_dir_time
backup_dir=/mnt/KEYSTORE_BACKUP/$backup_dir_time
cd /mnt/coodex/fileinfo
now_dir_modify=$(du -sl keystore|awk '{print $1}')
cd /etc/zabbix/scripts
last_dir_modify=$(awk '{print $1}'  ./.last_dir_modify.txt)


if [[ $now_dir_modify -gt $last_dir_modify  ]];then

cd /mnt/coodex/fileinfo

tar zcf $backup_dir/keystore_${now_time}.tar.gz keystore
echo "新的备份于  ${now_time}   keystore_${now_time}.tar.gz 打包完成"

fi
cd /etc/zabbix/scripts
echo $now_dir_modify  > .last_dir_modify.txt