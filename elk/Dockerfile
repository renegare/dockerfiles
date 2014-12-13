FROM ubuntu:14.04

MAINTAINER renegare <mudi@renegare.com>

ENV JAVA_VERSION                7
ENV ES_VERSION                  1.4.1
ENV LOGSTASH_VERSION            1.4.2
ENV KIBANA_VERSION              3.1.2
ENV SUPERVISORD_VERSION         3.1.3

ENV ES_CONFIG_FILE              /data/elasticsearch.yml
ENV LOGSTASH_CONFIG_FILE        /etc/logstash/logstash.conf

# workspace
WORKDIR /tmp

# install java
RUN apt-get update
RUN apt-get install -y \
    openjdk-$JAVA_VERSION-jdk \
    wget curl vim make \
    nginx apache2-utils
RUN java -version
RUN nginx -v

# install elasticsearch
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz
RUN tar zxvf elasticsearch-$ES_VERSION.tar.gz && \
    rm -rf elasticsearch-*.tar.gz && \
    mv elasticsearch-* /opt/elasticsearch && \
    /opt/elasticsearch/bin/elasticsearch -v

# install logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz
RUN tar zxf logstash-$LOGSTASH_VERSION.tar.gz && \
    rm -rf logstash-*.tar.gz && \
    mv logstash-* /opt/logstash && \
    /opt/logstash/bin/logstash -V

# install kibana
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz
RUN tar zxf kibana-$KIBANA_VERSION.tar.gz && \
    rm -rf kibana-*.tar.gz && \
    mkdir -p /var/www && \
    mv kibana-* /var/www/kibana

# install supervisord
RUN apt-get install -y python-setuptools && \
    easy_install supervisor==$SUPERVISORD_VERSION && \
    supervisord -v

# add configuration files
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY elasticsearch.yml          $ES_CONFIG_FILE
COPY logstash.conf              $LOGSTASH_CONFIG_FILE
COPY supervisord.conf           /etc/supervisord.conf
COPY kibana-insecure.conf       /etc/nginx/sites-available/kibana-insecure
COPY kibana-basic-auth.conf     /etc/nginx/sites-available/kibana-basic-auth
COPY logstash-certs.conf        /etc/nginx/sites-available/logstash
COPY kibana.js                  /var/www/kibana/config.js
COPY Makefile                   /root/Makefile

WORKDIR /root

EXPOSE 80 8080 9200 9300 9400

CMD echo $ES_VERSION-$LOGSTASH_VERSION-$KIBANA_VERSION
