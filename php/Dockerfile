FROM centos:7
MAINTAINER "Mudi Ugbo" <mudi@renegare.com>

# ENV INSTALLATION

RUN yum install -y epel-release && \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y \
        nginx \
        git && \
    yum install -y --skip-broken \
        php55w php55w-fpm php55w-mysql php55w-pecl-memcached php55w-pecl-memcache php55w-mbstring && \
    curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin

WORKDIR /tmp
ADD Makefile /tmp/Makefile

EXPOSE 80

ENTRYPOINT ["/usr/bin/make"]
