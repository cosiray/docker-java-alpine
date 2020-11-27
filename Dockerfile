FROM alpine:3.12.1
MAINTAINER lizhien "cosiray@sina.com"

# Set Environment
ENV BASE_DIR="/www" 
    PROFILE="dev" \
    DEVELOPER="service" \
    NACOS_ADDR="nacos:8848"

# Install JDK8
RUN apk update && \
    apk add openjdk8 bash busybox tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    echo alias ll="'ls -alh'" > /root/.bashrc && \
    apk del tzdata && \
    rm -rf /tmp/* /var/cache/apk/* \
	  ln -s /usr/lib/jvm/default-jvm/bin/jar /usr/bin/jar

# Entry
WORKDIR ${BASE_DIR}
CMD ["java", "-version"]
