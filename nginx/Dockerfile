FROM ubuntu:14.04
MAINTAINER Mudi Renegare <mudi@renegare.com>

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nginx=1.6.2-4+trusty0

RUN apt-get install -y curl wget

CMD nginx -v 2>&1 | grep -m 1 nginx | sed 's/[^0-9\.]//g'
