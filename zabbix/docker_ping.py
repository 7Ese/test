#!/usr/bin/python
import sys
import os
import json


def discover():
    d = {}
    d['data'] = []
    with os.popen("sudo docker ps -a --format {{.Names}}") as pipe:
        for line in pipe:
            info = {}
            info['{#CONTAINERNAME}'] = line.replace("\n","")
            d['data'].append(info)

    print(json.dumps(d))


def status(name,action):
    if action == "ping":
        cmd = 'sudo docker inspect --format="{{.State.Status}}" %s' %name
        result = os.popen(cmd).read().replace("\n","")
        if result == "running":
            print(1)
        else:
            print(0)
if __name__ == '__main__':
        try:
                name, action = sys.argv[1], sys.argv[2]
                status(name,action)
        except IndexError:
                discover()