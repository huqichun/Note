#!/usr/bin/env bash
#自用 只适用于 ARM  Debian
#更新apt
sudo apt-get update

#安装基本软件
sudo apt-get install curl wget apt-transport-https ca-certificates software-properties-common

#添加docker密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

#对比密钥
sudo apt-key fingerprint 0EBFCD88

#添加源
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#更新apt，安装docker
sudo apt-get update
sudo apt-get install docker-ce

#安装docker-compose
tag=$(wget -qO- -t1 -T2 "https://api.github.com/repos/docker/compose/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g') && curl -L https://github.sweb.pw/https://github.com/docker/compose/releases/download/${tag}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

#docker镜像源
tee /etc/docker/daemon.json <<-'EOF'
{
   "registry-mirrors": [
   "https://5ab94d45410f47b8b5667ccbe69007e3.mirror.swr.myhuaweicloud.com",
   "http://hub-mirror.c.163.com",
   "https://qjmjbszu.mirror.aliyuncs.com"
  ]
}
EOF
systemctl daemon-reload
systemctl restart docker


#测试
  sudo docker run hello-world |tee build.log
  if [[ `docker ps -a | grep -c "hello-world"` -ge '1' ]] && [[ `grep -c "hub.docker.com" build.log` -ge '1' ]]; then
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker rmi $(docker images -q)
    rm -fr build.log
  else
    rm -fr build.log
    sleep 2
    exit 1
  fi

docker version
