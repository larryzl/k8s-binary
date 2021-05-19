FROM alpine:3.13.5

MAINTAINER larry Zhang <190128084@qq.com>

ENV K8s_VERSION 'v1.18.19'

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk -q update \
	&& apk add -q wget \
	&& wget -q https://dl.k8s.io/${K8s_VERSION}/kubernetes-server-linux-amd64.tar.gz -O /opt/kubernetes-server-linux-amd64.tar.gz \
	&& wget -q https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 -O /opt/cfssl \
	&& wget -q https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 -O /opt/cfssljson \
	&& cd /opt ; tar zxf kubernetes-server-linux-amd64.tar.gz \
	&& rm -f rm -f kubernetes/kubernetes-src.tar.gz kubernetes/server/bin/*.tar kubernetes/server/bin/*_tag/kubernetes-src.tar.gz kubernetes/server/bin/*.tar kubernetes/server/bin/*_tag \
	&& mv kubernetes kubernetes-${K8s_VERSION} \
	&& tar czf kubernetes-${K8s_VERSION}.tgz kubernetes-${K8s_VERSION} \
        && apk del wget \
	&& rm -rf kubernetes-${K8s_VERSION} kubernetes-server-linux-amd64.tar.gz /var/cache/apk/* 
