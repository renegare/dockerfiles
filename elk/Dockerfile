FROM dockerfile/elasticsearch

MAINTAINER renegare <mudi@renegare.com>

ENV LOGSTASH_VERSION            1.4.2
ENV ES_CONFIG_FILE              /data/elasticsearch.yml
ENV LOGSTASH_CONFIG_FILE        /etc/logstash/logstash.conf
ENV SUPERVISORD_CONFIG_FILE     /etc/supervisor/conf.d/supervisord.conf
ENV KIBANA_VERSION              3.1.2


RUN apt-get update && apt-get install -y \
    supervisor nginx apache2-utils /var/www

RUN mkdir -p /data /var/log/supervisor /etc/logstash

WORKDIR /tmp

RUN curl -O https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz
RUN tar zxvf logstash-$LOGSTASH_VERSION.tar.gz && \
    rm -rf logstash-*.tar.gz && \
    mv logstash-* /opt/logstash

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz
RUN tar zxvf kibana-$KIBANA_VERSION.tar.gz && \
    rm -rf kibana-*.tar.gz && \
    mv kibana-* /var/www/html

COPY elasticsearch.yml          $ES_CONFIG_FILE
COPY logstash.conf              $LOGSTASH_CONFIG_FILE
COPY supervisord.conf           $SUPERVISORD_CONFIG_FILE
COPY logstash.key               /etc/logstash/logstash.key
COPY logstash.crt               /etc/logstash/logstash.crt
COPY nginx.conf                 /etc/nginx/sites-enabled/default
COPY kibana.js                  /var/www/html/config.js
COPY Makefile                   /Makefile

WORKDIR /

EXPOSE 80 9200 9300 9400

CMD make start
