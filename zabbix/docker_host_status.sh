#!/bin/bash
# -------------------------------------------------------------------------------
# Filename:    docker-status
# Revision:    1.1
# Date:    20190122
# Author:  wmy
# Email:
# Website:
# -------------------------------------------------------------------------------
# Notice
# After this state will docker stats reorder append to a file
# Auto Discovery docker stats Container Name --no-stream Execution time
###############################################################################
docker_name=`/usr/bin/docker ps -a|grep -v "CONTAINER ID"|awk '{print $NF}'`
for e in ${docker_name};do
        /usr/bin/docker stats $e --no-stream |awk 'NR==2{a=$2;b=$3;c=$4;d=$6;e=$10;f=$8;g=$13;h=$11;j=$7}END{print "CONTAINER "a"\n""CPU "b"\n""MEMUSAGE "c"\n""LIMIT "d"\n""NETI-O "e"\n""NETI-I "f"\n""BLOCKI-O "g"\n""BLOCKI-I "h" \n""MEM "j}'|awk -F'%' '{print $1}' |awk '{a=/G[i]?B/?$2*1024:(/M[i]?B/?$2*1:(/[Kk][Bb]/?$2/1024:(/B\>/?$2/1024/1024:$2)))}{print $1,a}' > /tmp/.$e.txt
done