#!/usr/bin/env bash

TIME l "安装依赖..."
echo
TIME y "安装依赖需要时间，请耐心等待!"
echo
sleep 3
echo
echo

echo "当前node版本(如果没有node，请自行安装): "
node -v

echo "当前npm版本(如果没有npm，请自行安装): "
npm -v

npm config set registry https://registry.npmmirror.com

cd /ql
npm install -g pnpm
pnpm add -g pnpm
pnpm install -g
npm install -g n
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && python3 -m pip install --upgrade pip

apk add python3 zlib-dev gcc jpeg-dev python3-dev musl-dev freetype-dev
 
pnpm install -g js-base64 qrcode-terminal silly-datetime

pip3 install requests cryptography pycryptodome bs4 redis Crypto

apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev

cd /ql/data/scripts/ && apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev
cd /ql
npm install -g npm png-js date-fns axios crypto-js ts-md5 tslib @types/node requests tough-cookie jsdom download tunnel fs ws form-data node-rsa jsencrypt ts-node typescript date-fns canvas


echo
TIME g "依赖安装完毕...建议重启 Docker "

echo
TIME g "有任何问题，请在此仓库提交Issue： https://github.com/FlechazoPh/QLDependency"
echo
exit 0
