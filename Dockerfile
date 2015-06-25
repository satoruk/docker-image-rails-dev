FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y build-essential curl git zlib1g-dev libssl-dev \
  libreadline-dev libyaml-dev libxml2-dev libxslt1-dev \
  ruby2.2 ruby2.2-dev mysql-client-5.6 libmysqld-dev \
  nodejs npm \
  imagemagick libmagick++-dev \
  redis-tools

# phantomjs
RUN apt-get install -y build-essential g++ flex bison gperf ruby perl
RUN apt-get install -y libsqlite3-dev libfontconfig1-dev libicu-dev
RUN apt-get install -y libfreetype6 libfreetype6-dev libssl-dev
RUN apt-get install -y libpng-dev libjpeg-dev libpng++-dev python libX11-dev libxext-dev
RUN apt-get install -y libpng12-dev
RUN apt-get install -y fonts-ipaexfont
WORKDIR /usr/src
RUN git clone git://github.com/ariya/phantomjs.git phantomjs
WORKDIR /usr/src/phantomjs
RUN git checkout 2.0
RUN ./build.sh --confirm
RUN mv bin/phantomjs /usr/local/bin
WORKDIR /usr/src
RUN rm -rf phantomjs

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN export RUBYGEMS_GEMDEPS=-
RUN gem install bundler
