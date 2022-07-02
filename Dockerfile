FROM ubuntu:21.04

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get clean && apt-get update \
    apt install -y mariadb-client

WORKDIR /app
ADD ibex /app
ADD etc /app/etc
RUN chmod +x ibex

EXPOSE 10090
EXPOSE 20090

CMD ["/app/ibex", "-h"]