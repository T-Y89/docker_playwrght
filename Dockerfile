# ベースとなるイメージを指定する
FROM node:14

# 作業ディレクトリを指定する
WORKDIR /app
COPY package*.json ./

# 必要なライブラリをインストールする
RUN apt-get update && apt-get install -y \
    wget \
    xvfb \
    libgtk-3-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    unzip \
    libgbm1\
    && rm -rf /var/lib/apt/lists/*
RUN npm install

COPY . .

CMD [ "node", "node --experimental-vm-modules pra.mjs" ]
