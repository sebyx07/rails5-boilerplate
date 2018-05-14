FROM ruby:2.5.1

# install manually all the missing libraries
RUN apt-get update && \
    apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 \
    libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 \
    fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

# install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  libmagickwand-dev \
  tesseract-ocr


RUN mkdir -p /app
WORKDIR /app

RUN npm i -g yarn

RUN gem install bundler
COPY Gemfile  Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5
