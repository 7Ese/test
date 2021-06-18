#!/bin/bash
#交易所

docker run -d --restart=always -p 8002:8000 --name tradex \
-v /opt/tradex/logs:/opt/bruntime/logs/ \
-v /opt/tradex/bundles:/bundles/ \
-v /etc/localtime:/etc/localtime -e JAVA_OPTS=""-Dofw.ordb.url=jdbc:mysql://47.93.200.170:3306/tradex?useUnicode=yes&characterEncoding=utf8 \

-Dofw.ordb.usr=root  \
-Dofw.ordb.pwd=Abcd1@#$  \
-Dorg.zippo.store.default_target=txdata \
-Dofw.actor.rootpath=/txs \
-Duser.timezone=GMT+08"" icwv.info/tps/bruntime:v2.0.2
# 充提 front api
docker run -d --restart=always -p 7070:8000 --name ex-front-api \
-v /mnt/ex-front-api/logs:/opt/bruntime/logs/ \
-v /mnt/ex-front-api/keystore:/opt/bruntime/keystore/ \
-v /mnt/ex-front-api/modules:/opt/bruntime/modules/ \
-v /mnt/ex-front-api/conf:/opt/bruntime/conf/ -e JAVA_OPTS=" \
-Dofw.ordb.url=jdbc:mysql://rm-t4n1e9ejj3pnblldz.mysql.singapore.rds.aliyuncs.com:3306/recharge?useUnicode=yes&characterEncoding=utf8 \
-Dofw.ordb.usr=recharge  \
-Duser.timezone=GMT+08 \
-Dfile.encoding=UTF8 \
-Dofw.ordb.pwd=99@J1WGIEL  \
-Dorg.zippo.store.default_target=exmysql \
-Dofw.actor.rootpath=/dex" registry.ap-southeast-1.aliyuncs.com/bitbang/exruntime:v1.0.0


#registry.ap-southeast-1.aliyuncs.com/bitbang/exruntime:v1.0.0
docker run -d --name btc -v /mnt/bitcoin:/bitcoin/data -p 18333:8333 -p 18332:8332 \
-e CONF_RPCPASSWORD=coodex registry.cn-hangzhou.aliyuncs.com/coodex/btc:v1.0.0

docker run -d --name eth -p 30313:30303 -p 8546:8545 \
-v /mnt/eth:/opt/data -v /etc/localtime:/etc/localtime \
registry.cn-hangzhou.aliyuncs.com/coodex/geth:v1.0.0

docker run -d --name ex-web --restart=always -p 9090:8080 \
-v /mnt/ex-web/web:/usr/share/nginx/html \
-v /mnt/ex-web/conf:/etc/nginx/conf.d \
nginx

# 充提后台api 
docker run -d --restart=always -p 8080:8000 --name ex-back-api \
-v /mnt/ex-back-api/logs:/opt/bruntime/logs/ \
-v /mnt/ex-back-api/keystore:/opt/bruntime/keystore/ \
-v /mnt/ex-back-api/modules:/opt/bruntime/modules/ \
-v /mnt/ex-back-api/conf:/opt/bruntime/conf/ -e JAVA_OPTS=" \
-Dofw.ordb.url=jdbc:mysql://rm-t4n1e9ejj3pnblldz.mysql.singapore.rds.aliyuncs.com:3306/recharge?useUnicode=yes&characterEncoding=utf8 \
-Duser.timezone=GMT+08 \
-Dfile.encoding=UTF8 \
-Dofw.ordb.usr=recharge  \
-Dofw.ordb.pwd=99@J1WGIEL  \
-Dorg.zippo.store.default_target=exmysql \
-Dofw.actor.rootpath=/dex \
" registry.ap-southeast-1.aliyuncs.com/bitbang/exruntime:v1.0.0

docker run -d --restart=always -p 8010:8000 --name=tx_engine \
-v /etc/localtime:/etc/localtime:ro \
-v /mnt/tx_engine/logs:/opt/bruntime/logs \
-v /mnt/tx_engine/modules/tradex:/opt/bruntime/modules/tradex \
-v /mnt/tx_engine/conf:/opt/bruntime/conf -e JAVA_OPTS="-Duser.timezone=GMT+08 \
-Dofw.ordb.url=jdbc:mysql://rm-t4n1e9ejj3pnblldz.mysql.singapore.rds.aliyuncs.com:3306/exchange?useUnicode=yes&serverTimezone=Asia/Shanghai&characterEncoding=utf8 \
-Dofw.ordb.usr=exchange -Dofw.ordb.pwd=9zkZZZH36bV9ZtV5 \
-Dorg.zippo.store.default_target=txmysql -Dofw.actor.rootpath=/tx" \
registry.ap-southeast-1.aliyuncs.com/bitbang/txruntime:v1.0.1

# 交易所api
docker run -d --restart=always -p 7080:8000 --name=tx_api -v /etc/localtime:/etc/localtime:ro -v /mnt/tx_api/logs:/opt/bruntime/logs/ -v  /mnt/tx_api/modules/tradex:/opt/bruntime/modules/tradex/ -v /mnt/tx_api/conf:/opt/bruntime/conf/ -e JAVA_OPTS=" \
-Duser.timezone=GMT+08 \
-Dofw.ordb.url=jdbc:mysql://rm-t4n1e9ejj3pnblldz.mysql.singapore.rds.aliyuncs.com:3306/exchange?useUnicode=yes&serverTimezone=Asia/Shanghai&characterEncoding=utf8 \
-Dofw.ordb.usr=exchange  \
-Dofw.ordb.pwd=9zkZZZH36bV9ZtV5  \
-Dorg.zippo.store.default_target=txmysql \
-Dofw.actor.rootpath=/tx \
" registry.ap-southeast-1.aliyuncs.com/bitbang/txruntime:v1.0.1
#cwv-game-runtime
docker run -d --restart=always -p 18001:8000 --name cwv-game-runtime-tmp \
-v /mnt/game-tmp/logs/:/opt/bruntime/logs \
-v /mnt/game-tmp/conf/:/opt/bruntime/conf \
-v /mnt/game-tmp/modules/:/opt/bruntime/modules \
-e JAVA_OPTS="-Dfile.encoding=UTF8 \
-Dofw.ordb.url=jdbc:mysql://cwvi.club:3306/cwv-game?useUnicode=yes&characterEncoding=utf8 \
-Dofw.ordb.usr=root  \
-Dofw.ordb.pwd=YaXwPvmb  \
-Dorg.zippo.store.default_target=gameorm \
-Dofw.actor.rootpath=/cwv "  icwv.info/cwv/bruntime:v2.0.0

#cwv-wallet-runtime
docker run -d --restart=always -m 4g --memory-swap -1 -p 19000:8000 --name cwv-wallet-runtime \
-v /mnt/wallet/logs/:/opt/bruntime/logs \
-v /mnt/wallet/conf/:/opt/bruntime/conf \
-v /mnt/wallet/modules/:/opt/bruntime/modules \
-e JAVA_OPTS="-Dfile.encoding=UTF8 \
-Duser.timezone=GMT+08 \
-XX:+UnlockCommercialFeatures     \
-XX:+FlightRecorder     \
-Xmx4G -Xms4G \
-Dofw.ordb.url=jdbc:mysql://13.228.124.44:3306/cwv-wallet?useUnicode=yes&characterEncoding=utf8 \
-Dofw.ordb.usr=root  \
-Dofw.ordb.pwd=YaXwPvmb  \
-Dorg.zippo.store.default_target=wltorm" icwv.info/cwv/bruntime:v2.0.0

#filebeat
#需要先创建filebeat.yml
docker run --name filebeat --restart=always -d \
-v /mnt/agent/filebeat.yml:/usr/share/filebeat/filebeat.yml \
-v /mnt/cwv/logs/:/usr/share/filebeat/logs \
docker.elastic.co/beats/filebeat:6.2.3

#cwv-node
docker run -d --restart=always -p 38000:8000 -p 35100:5100 --name ta205-38000 \
-v /mnt/cwv/logs/38000/:/opt/bruntime/logs \
-v /mnt/cwv/db/38000/:/opt/bruntime/db/ -v /mnt/cwv/modules/:/opt/bruntime/modules \
-v /mnt/cwv/conf/:/opt/bruntime/conf -v /mnt/cwv/keystore/:/opt/bruntime/keystore \
-e JAVA_OPTS="-Dfile.encoding=UTF8 -XX:+UnlockCommercialFeatures -XX:+FlightRecorder \
-Xmx3G -Xms3G -Dorg.bc.dpos.max.wait.blk.epoch.ms=60000 -Duser.timezone=GMT+08 \
-Dorg.bc.manage.node.net=testnet -Dorg.bc.manage.node.keystore.num=7 \
-Dorg.bc.dpos.blk.epoch.ms=500 -Dorg.bc.dpos.dtv.mul.blocks.each.term=100 \
-Dotrans.addr.out=ta205.icwv.co -Dotrans.port.out=35100 \
-Dorg.bc.pzp.networks.raft.nodelist=tcp://ta205.icwv.co:35100 \
-Dorg.bc.pzp.networks.dpos.nodelist=tcp://ta300.icwv.co:35102" icwv.info/cwv/bruntime:v2.0.0

#readme
docker run -d -p 3306:3306 -v /mnt/redmine/db:/var/lib/mysql --name redmine-mysql \
-e MYSQL_ROOT_PASSWORD=YaXwPvmb mysql:5.6

docker run -d --name cwv-redmine -e REDMINE_DB_DATABASE=pm -e REDMINE_DB_PASSWORD=YaXwPvmb \
-v /mnt/redmine/data:/usr/src/redmine/files -p 5000:3000 \
--link redmine-mysql:mysql redmine

#prom
docker run -d --restart=always -p 9100:9100 prom/node-exporter:v0.14.0

# nexus
mkdir -P /mnt/resource/nexus-data && chown -R 200 /mnt/resource/nexus-data
docker run -d -p 8081:8081 --name nexus -v /mnt/resource/nexus-data:/sonatype-work --restart always sonatype/nexus:oss

# 节点管理器
docker run -d --restart=always -p 38001:8000 -p 35101:5100 --add-host ta30:192.168.0.229 \
--name ta30-38001 -v /mnt/cwv/logs/38001/:/opt/bruntime/logs -v /mnt/cwv/db/38001/:/opt/bruntime/db/ -v /mnt/cwv/modules/:/opt/bruntime/modules -v /mnt/cwv/clib/:/opt/bruntime/clib -v /mnt/cwv/genesis/:/opt/bruntime/genesis -v /mnt/cwv/conf/:/opt/bruntime/conf -v /mnt/cwv/keystore/:/opt/bruntime/keystore -e JAVA_OPTS="-Dfile.encoding=UTF8 -Xmx3G -Xms3G \
-Dorg.bc.dpos.max.wait.blk.epoch.ms=180000 -Duser.timezone=GMT+08 \
-Dorg.bc.manage.node.net=testnet \
-Dorg.bc.dpos.dtv.mul.blocks.each.term=100 \
-Dorg.bc.dpos.blk.epoch.ms=1000 \
-Dotrans.addr.out=ta30 -Dotrans.port.out=35101 \
-Dorg.brewchain.man.dev=false \
-Dorg.bc.pzp.networks.raft.nodelist=tcp://ta30:35101 \
-Dorg.bc.pzp.networks.dpos.nodelist=tcp://ta30:35101" \
registry.cn-hangzhou.aliyuncs.com/cwv/bruntime:v4.1.1

docker run --name myzookeeper --restart=always -p 2181:2181 -p 2888:2888 -p 3888:3888 --net=host \
-v /mnt/zookeeper/data:/opt/zookeeper/data \
-v /mnt/zookeeper/logs:/opt/zookeeper/logs \
-v /mnt/zookeeper/conf:/opt/zookeeper/conf -d zookeeper

docker run --name some-zookeeper --restart=always -p 2181:2181 -p 2888:2888 -p 3888:3888 \
-e "ZOO_MY_ID=1" \
-v /mnt/zookeeper/data:/data \
-v /mnt/zookeeper/logs:/logs \
-v /mnt/zookeeper/conf:/conf -d zookeeper

docker run --name some-zookeeper --restart=always -p 2181:2181 -p 2888:2888 -p 3888:3888 \
-e "ZOO_MY_ID=2" \
-v /mnt/zookeeper/data:/data \
-v /mnt/zookeeper/logs:/logs \
-v /mnt/zookeeper/conf:/conf -d zookeeper

docker run --name some-zookeeper --restart=always -p 2181:2181 -p 2888:2888 -p 3888:3888 \
-e "ZOO_MY_ID=3" \
-v /mnt/zookeeper/data:/data \
-v /mnt/zookeeper/logs:/logs \
-v /mnt/zookeeper/conf:/conf -d zookeeper

docker run -d --restart=always -p 38000:8000 -p 35100:5100 --add-host ta202:192.168.0.232 \
--name ta202-38000 -v /mnt/cwv/logs/38000/:/opt/bruntime/logs -v /mnt/cwv/db/38000/:/opt/bruntime/db/ -v /mnt/cwv/modules/:/opt/bruntime/modules -v /mnt/cwv/clib/:/opt/bruntime/clib -v /mnt/cwv/genesis/:/opt/bruntime/genesis -v /mnt/cwv/conf/:/opt/bruntime/conf -v /mnt/cwv/keystore/:/opt/bruntime/keystore -e JAVA_OPTS="-Dfile.encoding=UTF8 -Xmx2G -Xms2G \
-Dorg.bc.dpos.max.wait.blk.epoch.ms=180000 -Duser.timezone=GMT+08 \
-Dorg.bc.manage.node.net=testnet \
-Dorg.bc.dpos.dtv.mul.blocks.each.term=100 \
-Dorg.bc.dpos.blk.epoch.ms=1000 \
-Dotrans.addr.out=ta30 -Dotrans.port.out=35101 \
-Dorg.brewchain.man.dev=false \
-Dorg.bc.pzp.networks.raft.nodelist=tcp://ta30:35101 \
-Dorg.bc.pzp.networks.dpos.nodelist=tcp://ta30:35101" \
registry.cn-hangzhou.aliyuncs.com/cwv/bruntime:v4.1.1

