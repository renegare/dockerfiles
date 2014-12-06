FROM renegare/php:latest

MAINTAINER Mudi Renegare <mudi@renegare.com>

# Install PhantomJs
RUN apt-get update
RUN apt-get install -y build-essential chrpath libssl-dev libxft-dev
RUN apt-get install -y \
    libfreetype6 libfreetype6-dev \
    libfontconfig1 libfontconfig1-dev

WORKDIR /tmp
RUN export PHANTOM_JS="phantomjs-1.9.7-linux-x86_64" && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS.tar.bz2 /usr/local/share/ && \
    cd /usr/local/share/ && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs

# install ruby, bundler, cucumber
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.0 --gems=bundler

CMD /bin/bash -lc 'echo r$(ruby -v | sed -E "s/^ruby ([0-9\.]+)[^0-9\.].*$/\1/")-p$(phantomjs --version)'
