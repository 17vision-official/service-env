# syntax=docker/dockerfile:1

FROM alpine:latest

# 更新和安装 alpine 工具
RUN apk add --update alpine-sdk

RUN apk add --no-cache bash

RUN apk add readline-dev readline autoconf libgcc

# 安装 supervisor (并创建文件夹)
RUN apk add supervisor && mkdir /etc/supervisor.d

# 安装 git
RUN apk add git

WORKDIR /skynet

RUN git clone https://github.com/cloudwu/skynet.git /skynet

RUN make linux