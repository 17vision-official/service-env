ARG NODE_IMAGE
FROM ${NODE_IMAGE}

# 安装项目依赖
RUN npm install

RUN npm install -g pm2

RUN npm config set registry  https://registry.npmmirror.com