FROM alpine:3.13.5

MAINTAINER larry Zhang <190128084@qq.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk -q update \
	&& apk add -q wget \
	&& wget -q https://github.com/coreos/flannel/releases/download/v0.11.0/flannel-v0.11.0-linux-amd64.tar.gz -O /opt/flannel-v0.11.0-linux-amd64.tar.gz \
        && apk del wget \
	&& rm -rf /var/cache/apk/* 
