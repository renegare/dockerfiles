FROM renegare/php:latest
MAINTAINER Mudi Renegare <mudi@renegare.com>

RUN apt-get update

RUN apt-get install -y \
    git-core curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev libyaml-dev \
    libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
    libcurl4-openssl-dev python-software-properties

RUN apt-get install -y \
    libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

# ruby and compass
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -lc 'curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable --ruby --gems=compass'

RUN apt-get -y install nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g grunt-cli bower

CMD echo '1.0.0'
