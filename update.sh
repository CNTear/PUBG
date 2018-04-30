#!/bin/bash
echo "开始运行一键脚本"
echo "交流QQ群：677932058"
echo "即将搭建的是4.31版本"
echo "准备开始安装"
read -p "回车后开始安装"
echo "请输入你的内网ip" 
read -p "内网ip： " ip
cp /root/winnerpubg/restart.sh /root/restart.sh
chmod +x restart.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "ss搭建成，请牢记连接信息"
read -p "请认真记录！下一步任意键继续" 

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

git clone https://github.com/q2514994747/PUBG.git
cd PUBG/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "搭建完成！稳定奔放不封号！且用且珍惜QQ群677932058"
