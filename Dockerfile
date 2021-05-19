FROM alpine:3.13.5

ENV K8s_VERSION 'v1.19.11'

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk update \
	&& apk add wget \
	&& wget https://dl.k8s.io/${K8s_VERSION}/kubernetes-server-linux-amd64.tar.gz -O /opt/kubernetes-server-linux-amd64.tar.gz \
	&& cd /opt ; tar zxf kubernetes-server-linux-amd64.tar.gz \
	&& rm -f rm -f kubernetes/kubernetes-src.tar.gz kubernetes/server/bin/*.tar kubernetes/server/bin/*_tag/kubernetes-src.tar.gz kubernetes/server/bin/*.tar kubernetes/server/bin/*_tag \
	&& mv kubernetes kubernetes-${K8s_VERSION} \
	&& tar czf kubernetes-${K8s_VERSION}.tgz kubernetes-${K8s_VERSION} \
	&& rm -rf kubernetes-${K8s_VERSION} kubernetes-server-linux-amd64.tar.gz /var/cache/apk/* 
