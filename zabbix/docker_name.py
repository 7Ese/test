#!/usr/bin/python
# -------------------------------------------------------------------------------
# Filename:    docker_name
# Revision:    1.1
# Date:        20190122
# Author:      wmy
# Email:
# Website:
# -------------------------------------------------------------------------------
# Notice
# Automatic discovery instance name
###############################################################################
import os
import json
t=os.popen("""sudo /usr/bin/docker ps -a|grep -v "CONTAINER ID"|awk '{print $NF}' """)
docknam = []
for dname in  t.readlines():
        r = os.path.basename(dname.strip())
        docknam += [{"{#DOCKERNAME}":r}]
print json.dumps({"data":docknam},sort_keys=True,indent=4,separators=(",",":"))