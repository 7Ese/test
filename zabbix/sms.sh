
#!/bin/bash

#获取登录者的用户名
user=$USER
#获取登录者的IP地址
ip=${SSH_CLIENT%% *}
#获取登录的时间
time=$(date +%F%t%k:%M)
time=$(date "+%Y-%m-%d %H:%M:%S")
#服务器的IP地址
hostname=$(hostname)
curl -s --connect-timeout 3 --data-urlencode "content=【报警】$user,$time登录$hostname,IP:$ip" "http://47.240.5.175:4080/sendsmsls.do?username=TDM66&password=hXup0aNl&mobile=8618614059766&productid=190515" >>/etc/ssh/log
echo ",http://47.240.5.175:4080/sendsmsls.do?username=TDM66&password=hXup0aNl&content=【报警】$user,$time登录$hostname,IP:$ip&mobile=8618614059766&productid=190515" >> /etc/ssh/log
