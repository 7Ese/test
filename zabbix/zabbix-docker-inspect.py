#!/usr/bin/python


import sys
import subprocess
import os
import time
import json

#################################################################
# sys.argv[1] - the instanceID of the docker container
# sys.argv[2] - the JSON value of the key to collect
#################################################################


def local_run_command(cmd,file):
	cmd = cmd + " | tee > " + file
	if os.path.isfile(file) == False:
		os.system(cmd)
	else:
		(mode, ino, dev, nlink, uid, gid, size, atime, mtime, ctime) = os.stat(file)
		ticks=int(time.time())
		delta=ticks-mtime
		if (delta > 60):
			os.system(cmd)

	strings = open(file,"r").read()
	return strings

cmd="sudo docker inspect " + sys.argv[1]
strings = local_run_command(cmd,"/tmp/zabbix-docker-inspect-"+sys.argv[1]+".out")

parsed_json = json.loads(strings)

key_path = sys.argv[2].split('.')

ptr = parsed_json[0]

for i in range(0,len(key_path)):
	ptr=ptr[key_path[i]]

print(ptr)
