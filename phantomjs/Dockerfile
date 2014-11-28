FROM dockerfile/ruby

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

CMD phantomjs --version
