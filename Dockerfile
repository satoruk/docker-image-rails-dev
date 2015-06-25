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

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN export RUBYGEMS_GEMDEPS=-
RUN gem install bundler
