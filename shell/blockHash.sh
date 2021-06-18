#!/usr/bin/env bash
#Auth doufangyu@163.com
#date 2018-11-20
#check blockHash
block=$1
c1=$(curl -s  http://c00/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c2=$(curl -s  http://c01/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c3=$(curl -s  http://c02/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c4=$(curl -s  http://c03/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c5=$(curl -s  http://c04/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c6=$(curl -s  http://c05/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c7=$(curl -s  http://c06/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c8=$(curl -s  http://c07/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c9=$(curl -s  http://c08/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c10=$(curl -s  http://c09/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c11=$(curl -s  http://c10/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c12=$(curl -s  http://c11/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c13=$(curl -s  http://c12/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c14=$(curl -s  http://c13/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c15=$(curl -s  http://c14/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c16=$(curl -s  http://c15/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c17=$(curl -s  http://c16/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c18=$(curl -s  http://c17/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c19=$(curl -s  http://c18/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c20=$(curl -s  http://c19/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
c21=$(curl -s  http://pihb-node.cwv.one/fbs/bct/pbgbn.do?bd={'number':$block} |awk -F'\"' '{print $6}')
echo c00  $c1
echo c01  $c2
echo c02  $c3
echo c03  $c4
echo c04  $c5
echo c05  $c6
echo c06  $c7
echo c07  $c8
echo c08  $c9
echo c09  $c10
echo c10  $c11
echo c11  $c12
echo c12  $c13
echo c13  $c14
echo c14  $c15
echo c15  $c16
echo c16  $c17
echo c17  $c18
echo c18  $c19
echo c19  $c20
echo c20  $c21
