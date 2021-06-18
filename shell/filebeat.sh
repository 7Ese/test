#!/bin/bash
#eg:curl http://13.251.10.238:9000/filebeat.sh | bash -s --  kt1-or
hostname=$1
function createfilebeat(){
	mkdir -p /mnt/agent
	cd /mnt/agent
	curl http://13.251.10.238:9000/filebeat.yml --silent -O
	#sed -i -e "s/ktname/$hostname/g" filebeat.yml
	
}

if [ -z "$hostname" ];then  
	echo 'please input hostname... '
	exit 1
else
	createfilebeat
fi