FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  vim


RUN mkdir -p /app
WORKDIR /app

RUN npm i -g yarn phantomjs --unsafe-perm

RUN gem install bundler
COPY Gemfile  Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
