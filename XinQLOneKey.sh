#!/usr/bin:/usr/lib/node_modules:/usr/local/bin:

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

exit 0
